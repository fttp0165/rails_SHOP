Rails.application.routes.draw do
  devise_for :users,controllers: {
    sessions: 'users/sessions',
    registrations:'users/registrations',
    passwords:'users/passwords',
    confirmations:'users/confirmations',
    unlocks:'users/unlocks',
  #  omniauth_callbacks:'users/omniauth_callbacks'
  }
  
  mount RailsAdmin::Engine => '/beadmin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      root "flower#flower"
      # get  "flower",to:"flower#flower"
      get  "wedding",to:"wedding#wedding"
      resources :wedding_photos
      get "admin/login",to: "admin#login"
      post "admin/create_session",to: "admin#create_session"
      get "admin/logout",to: "admin#logout"
      resources :flower_products
      resources :flower_categories
      resources :cart_items
      resources :orders do
        collection do
          get :admin
        end
      end
      resources :payments

      get "flower_user/log_in",to: "flower_user#log_in"
      post "flower_user/create_session",to: "flower_user#create_session"
			get "flower_user/log_out",to: "flower_user#log_out"
			#===================
      # devise_for :users
      # devise_scope :user do
      #   get '/users/sign_out' => 'devise/sessions#destroy'
			# end
			#==================

	#==============
      resources :categories ,param: :category_id ,only:[]do
      	member do
      		get :flower_products
      		 resources :subcategories, param: :subcategories_id ,only:[]do
      	        member do
      		        get :flower_products
      	        end
             end
         end
       end 

     

end
