Rails.application.routes.draw do

  root  "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products

  get "admin/log_in",to: "admin#log_in"
  post "admin/create_session",to: "admin#create_session"
  post "admin/log_in",to: "admin#log_in"
  get "admin/log_out",to: "admin#log_out"
end
