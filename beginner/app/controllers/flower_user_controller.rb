class FlowerUserController < ApplicationController

	def log_in
	
	end
	def log_out
		session[:current_user_id]=nil
		redirect_to action: :index ,controller: :flower_products

	end
	def create_session
		
		user=FlowerUser.find_by(email: params[:email],password: params[:password])
		if user
		session[:current_user_id]=user.id
		flash[:notice]="登入成功"
		redirect_to action: :index ,controller: :flower_products
		return
		end
		flash[:notice]="登入失敗"
		redirect_to action: :log_in
		#redirect_to action: :new
	end
end
#benny08118@gmail.com