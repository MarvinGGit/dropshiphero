class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :show, :update]
    before_action :require_same_user, only: [:edit, :update]

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
    end
 
    def update
        if @user.update(user_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to root_path
    end

    def index 
        redirect_to root_path
    end

    private 
        def user_params
            params.require(:user).permit(:username, :email, :password, :firstname, :lastname)
        end

        def set_user
            @user = User.find(params[:id])
        end

        def require_same_user
            if current_user != @user 
                redirect_to root_path
            end
        end

end