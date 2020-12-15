class OrdersController < ApplicationController
  before_action :redirect_to_index_if_not_login
  before_action :get_order,only:[:show,:update,:destroy]
	
	def index
	#顯示使用者底下所有訂單	
	@order=current_user.orders
	end

	def show
	#顯示一個訂單
	@order_items=@order.order_items
	end

	def create
		if current_user.buy_now_cart_items.count == 0
			flash[:notice]="沒有這項商品"
			redirect_to cart_items_path
			return
		end
	#建立一個訂單
	#order_not_pay
	
	@order=Order.not_paid.create(
	  user: current_user,
	  user_name: current_user.name,
	  user_address: current_user.address,
	  user_phone: current_user.phone
	)

	current_user.buy_now_cart_items.each do |cart_item|
		begin
			@orderitem=OrderItem.create(
				order: @order,
				flower_product: cart_item.flower_product,
				quantity: cart_item.quantity,
				price:		cart_item.product_price,
			)
		rescue 
			@order.order_items.destroy_all
			@order.destroy
			flash[:notice]="建立訂單失敗"
			redirect_to root_path
			return
		end
	end
	#刪除購物車內容
	current_user.buy_now_cart_items.destroy_all

	flash[:notice]="建立訂單成功"
	redirect_to payments_path(order_id: @order.id)
	end

	def update
		
		if params[:payment_method]=="credit_card"
		@order.paid!
		flash[:notice]="付款成功"
		redirect_to root_path
		else
			flash[:notice]="待付款"
			redirect_to root_path
		end
	end

	def destroy
		
	end

	private
	def redirect_to_index_if_not_login
		if !current_user
			flash[:notice]="尚未登入"
            redirect_to action: :index ,controller: :flower_products
			return
		end
	end
	def get_order
		@order=Order.find_by_id(params[:id])
		if !@order
		flash[:notice]="訂單不存在"
		redirect_to root_path
		end
	end
    

end
