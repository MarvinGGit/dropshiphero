class PagesController < ApplicationController

    def home
        if logged_in?
            redirect_to products_path
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