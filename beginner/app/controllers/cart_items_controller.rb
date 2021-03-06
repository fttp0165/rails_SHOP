class CartItemsController < ApplicationController
    before_action :redirect_to_index_if_not_login
    before_action :get_cart,except:[:index,:update,:destroy]
    before_action :get_cart_item,only:[:update,:destroy]
    def index
        @buy_now_items=current_user.buy_now_cart_items
        @buy_next_time_items=current_user.buy_next_time_cart_items
        @amount=current_user.buy_now_cart.amount
    end

    def create
        product=FlowerProduct.find_by(id: params[:flower_product_id])
        if !product
            flash[:notice]="沒有這個商品"
            redirect_to action: :index ,controller: :flower_products
        end
        CartItem.create(flower_product: product,quantity: 1 ,cart: @cart)
        if @cart.buy_now?
            flash[:notice]="加入購物車成功"
        elsif @cart.buy_next_time?
            flash[:notice]="加入下次購買成功"
        end
        redirect_to flower_products_path(product)
    end

    #修改商品
    def update
      if @cart_item.update(cart_item_permit)
        flash[:notice]="更新成功"
      else
        flash[:notice]="更新失敗"
      end
    end

    #刪除商品
    def destroy
      @cart_item.destroy
      if @cart_item.destroyed?
        flash[:notice]="刪除成功"
        redirect_to action: :index ,controller: :flower_products
      else
        flash[:notice]="刪除失敗"
        redirect_to action: :index ,controller: :flower_products
      end
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
        @cart=current_user.carts.find_by(cart_type: params[:cart_type])
        if !@cart
            flash[:notice]="沒有找到目標購物車product_primet"
            redirect_to action: :index ,controller: :flower_products
            return
        end
    end   

    def get_cart_item 
        @cart_item=CartItem.find_by_id(params[:id])
        if !@cart_item || @cart_item.user != current_user
            flash[:notice]="沒有找到購物車內商品"
            redirect_to action: :index ,controller: :flower_products
            return
        end
    end

    def cart_item_permit
      params.require(:cart_item).permit(:quantity)
    end

end
