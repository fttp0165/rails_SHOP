class AdminController < ApplicationController


	def login
		current_user_id=session[:current_user_id]
		if current_user_id
			@current_user=User.find_by_id(current_user_id)
			@current_user_name=@current_user.name
		end
	end

	def logout
		session[:current_user_id]=nil
		redirect_to action: :login
	end

	def create_session

		user=User.find_by(email: params[:email],password: params[:password])
		if user
			session[:current_user_id]=user.id
			flash[:notice]="登入成功"
		end
		redirect_to action: :login
	end
end
