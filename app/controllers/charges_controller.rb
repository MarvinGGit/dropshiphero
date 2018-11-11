class ChargesController < ApplicationController
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

      

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
