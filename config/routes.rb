Rails.application.routes.draw do
  resources :post_attachments
  devise_for :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/about'
  root 'home#index'
end
