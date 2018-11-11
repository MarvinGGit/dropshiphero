class CategoriesController < ApplicationController

    before_action :authenticate_user!
    before_action :is_user_subscribed

    def new
        if current_user.admin?
            @category = Category.new
        else
            redirect_to root_path
        end

    end

    def create 
        if  current_user.admin?
            @category = Category.new(category_params)
            if @category.save
                redirect_to categories_path
            else
                render 'new'
            end
        else
            redirect_to root_path
        end
    end

    def update
        if  current_user.admin?
            set_category
            if @category.update(category_params)
                redirect_to category_path(@category)
            else
                render 'edit' 
            end
        else
            redirect_to root_path
        end
    end

    def edit
        if  current_user.admin?
          set_category
        else
            redirect_to root_path
        end
    end

    def show 
        
            set_category
            @title = @category.name + " Products"
            @categories = Category.all
            @products = @category.products
       
            redirect_to root_path
 
    end

    def index 
            @categories = Category.all
        
            redirect_to root_path
        
    end

    private
        def category_params
            params.require(:category).permit(:name)
        end

        def set_category
            @category = Category.find(params[:id])
        end

        def is_user_subscribed
            if !current_user.subscribed? and !current_user.admin?
                redirect_to subscribe_path
            end
        end

        
end