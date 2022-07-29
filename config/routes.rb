Rails.application.routes.draw do
  resources :order_details
  resources :orders
  resources :product_categories
  resources :categories
  resources :product_options
  resources :options
  resources :products, only: [:index, :show] do
    member do
      get :hovercard
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :webhooks, only: [:create]
  post "checkout/create", to: "checkout#create"
  get "success", to: "checkout#success"
  get "cancel", to: "checkout#cancel"

  root "products#index"
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
end
