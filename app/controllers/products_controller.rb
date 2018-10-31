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
        if !logged_in?
            redirect_to root_path
        else
            @products = Product.all
        end
    end 

    def update

    end 
    
    def show
        if !logged_in?
            redirect_to root_path
        else
            set_product
            if @product.audiences
                @audiences = @product.audiences.split(',')
            end
            if @product.influencer
                @influencer = @product.influencer.split(',')
            end
            
            @profit = (@product.sellprice - @product.storeprice)
        end
    end

    def destroy 
        set_product
        @product.destroy
        redirect_to root_path 
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
        if logged_in? and current_user.admin?
             @product = Product.new
        else
            redirect_to root_path
        end
    end

    def edit
        set_product
    end

    private 
        def set_product
            @product = Product.find(params[:id])
        end

        def product_params 
            params.require(:product).permit(:title, :img, :buyprice, :sellprice, :description, :adcopy, :audiences, :videoadurl, :imageadurl, :influencer, :instagramadcopy, :freeplusshipping, :storename, :storeurl, :storeprice, :storefeedbackscore, :storeepacketprice, :storeepacket)
        end
end