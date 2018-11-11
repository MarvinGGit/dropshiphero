class PagesController < ApplicationController

    def home
        if user_signed_in?
            if current_user.subscribed? or current_user.admin?
                redirect_to products_path
            else
                redirect_to subscribe_path
            end
        end

    end

    def dashboard
        if current_user.admin?
              @usercount = User.count
        else
            redirect_to root_path
        end
    end

end