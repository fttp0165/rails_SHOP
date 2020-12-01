class OrdersController < ApplicationController
	before_action :redirect_to_index_if_not_login
	before_action :get_cart,except:[:index]
	before_action :get_cart_item,only:[:update,:destory]
	def index
	
	end

	def show
		
	end

	def create
		
	end

	def update
		
	end

	def destroy
		
	end

	private


end
