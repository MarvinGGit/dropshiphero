class PagesController < ApplicationController

    def home
        if logged_in?
            redirect_to products_path
        end
    end

    def dashboard
        @usercount = User.count
    end

end