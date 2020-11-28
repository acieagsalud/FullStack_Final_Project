Rails.application.routes.draw do
  resources :users, only: %i[new create]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "welcome", to: "sessions#welcome"
  get "authorized", to: "sessions#page_requires_login"

  get "products/index"
  get "products/show"
  get "products/sale"
  get "products/new"
  root to: "pages#index"

  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  patch "products/update_cart_quantity/:id", to: "products#update_cart_quantity", as: "update_cart_quantity"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope "/charges" do
    post "create/:id", to: "charges#new", as: "charges_new"
  end

  resources :charges

  resources "products", only: %i[index show sale]

  resources "category", only: %i[index show]

  resources "manufacturer", only: %i[index show]

  resources "subcategory", only: %i[index show]

  resources :pages
  get "/p/:permalink", to: "pages#permalink", as: "permalink"
end
