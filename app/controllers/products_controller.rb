class ProductsController < ApplicationController


    def create 
        @product = Product.new(product_params)
        if @product.save
            redirect_to product_path(@product)
        else
            render 'new'
        end

    end

    def index 

    end 

    def update

    end 
    
    def show
        set_product
        @profit = (@product.sellprice - @product.buyprice)
    end

    def delete 

    end

    def update
        set_product
        if @product.update(product_params)
            redirect_to product_path(@product)
        else
            render 'edit' 
        end

    end

    def new
        @product = Product.new
    end

    def edit
        set_product
    end

    private 
        def set_product
            @product = Product.find(params[:id])
        end

        def product_params 
            params.require(:product).permit(:title, :img, :buyprice, :sellprice, :description)
        end
end