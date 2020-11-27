Rails.application.routes.draw do
  get 'subcategory/index'
  get 'subcategory/show'
  get 'category/index'
  get 'category/show'
  get 'manufacturer/index'
  get 'manufacturer/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
