class ChargesController < ApplicationController
    before_action :authenticate_user!
    
    def new
      if current_user.subscribed? 
        flash[:warning] = "You are already subscribed!"
        redirect_to root_path
      end
    end
    
    def create
      # Amount in cents
      @amount = 1499
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      subscription = Stripe::Subscription.create(
        :customer => customer.id,
        :items => [
          {
            :plan => "plan_DxBOyspDDcF2E0",
          },
        ],
        :trial_from_plan => true
      )

      current_user.subscribed = true
      current_user.subscriptionid = subscription.id
      current_user.customerid = customer.id

      current_user.subscribe_until = nil
      current_user.save!

      flash[:success] = "You are now subscribed!"
      redirect_to root_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to subscribe_path
    end

    def endsubscription
      if current_user.subscribed?
        sub = Stripe::Subscription.retrieve(current_user.subscriptionid)
        sub.delete

        current_user.subscribed_until = Time.at(sub.current_period_end)
        current_user.save!

        flash[:success] = "You successfully canceled your subscription! You will still have access until your current subscription runs out."
        redirect_to profile_path
      else
        redirect_to subscribe_path
      end
    end


end
