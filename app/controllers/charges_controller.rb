class ChargesController < ApplicationController
    before_action :authenticate_user!
    
    def new
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
        ]
      )

      #current_user.subscribed = true
      #current_user.subscriptionid = subscription.id
      #current_user.customerid = customer.id

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
