class CartItemsController < ApplicationController

    before_action :redirect_to_index_if_not_login
    before_action :get_cart,except:[:index]
    before_action :get_car_item,only:[:update,:destroy]

    def index
    end

    def create
        product=FlowerProduct.find_by_id(params[:flower_product_id])
        if !product
            flash[:notice]="沒有這個商品"
            redirect_to root_path   
            return
        end
        CartItem.create(flower_product: product,quantity:1,cart:@cart)
        if @cart.buy_now?
            flash[:notice]="加入商品成功"
        elsif @cart.buy_next_time?
            flash[:notice]="加入下次購買"
        end 
        
        redirect_to flower_product_path(product)
    end

    def update
    end

    def destroy
        #@cart_item
    end

    private


    def redirect_to_index_if_not_login
		if !current_user
			flash[:notice]="尚未登入"
			redirect_to action: :index ,controller: :flower_products
			return
		end
    end
    def get_cart
        @cart= current_user.carts.find_by(cart_type: params[:cart_type])
        if !@cart
            flash[:notice]="沒有找到目標購物車商品"
            redirect_to :index
            return
        end
    end
    
    def get_car_item
        
    @cart_item=@cart.cart_item.find_by_id(params[:id])

    if !@cart_item
        flash[:notice]="沒有找到目標購物車商品"
        redirect_to :index
        return
    end
    end

end
