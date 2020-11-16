class FlowerUserController < ApplicationController

	before_action	:redirect_to_index_if_login, except:[:log_out]
	before_action	:redirect_to_index_if_not_login, only:[:log_out]

	def log_in
	
	
	end
	def log_out
		session[:current_user_id]=nil
		flash[:notice]="登出成功"
		redirect_to action: :index ,controller: :flower_products
		return

	end

	private
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

	def redirect_to_index_if_login
		if current_user
			flash[:notice]="已經登入了"
			redirect_to action: :index ,controller: :flower_products
			return
		end
	end

	def redirect_to_index_if_not_login
		if !current_user
			flash[:notice]="尚未登入"
			redirect_to action: :index ,controller: :flower_products
			return
		end
	end

end
#benny08118@gmail.com