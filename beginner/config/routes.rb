Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      root "home#index"
      get  "flower",to:"flower#flower"
      get  "wedding",to:"wedding#wedding"
      resources :wedding_photos
      get "admin/login",to: "admin#login"
      post "admin/create_session",to: "admin#create_session"
      get "admin/logout",to: "admin#logout"
      resources :flower_products
      resources :flower_categories

      get "flower_user/log_in",to: "flower_user#log_in"
      post "flower_user/create_session",to: "flower_user#create_session"
      get "flower_user/log_out",to: "flower_user#log_out"

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
