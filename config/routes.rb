Rails.application.routes.draw do
  resources :order_details
  resources :orders
  resources :product_categories
  resources :categories
  resources :product_options
  resources :options
  resources :products
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
