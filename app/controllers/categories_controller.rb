class CategoriesController < ApplicationController

    def new
        if logged_in? and current_user.admin?
            @category = Category.new
        else
            redirect_to root_path
        end

    end

    def create 
        if logged_in? and current_user.admin?
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
        if logged_in? and current_user.admin?
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
        if logged_in? and current_user.admin?
          set_category
        else
            redirect_to root_path
        end
    end

    def show 
        if logged_in? 
            set_category
            @title = @category.name + " Products"
            @categories = Category.all
            @products = @category.products
        else
            redirect_to root_path
        end
    end

    def index 
        if logged_in?
            @categories = Category.all
        else
            redirect_to root_path
        end
    end

    private
        def category_params
            params.require(:category).permit(:name)
        end

        def set_category
            @category = Category.find(params[:id])
        end

        
end