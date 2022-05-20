Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :post_attachments
  devise_for :users

  resources :posts do
    resources :post_likes, only: [:create, :destroy]
    resources :follows, only: [:create, :destroy]
    resources :post_comments, only: [:create , :destroy]
    get :like_unlike
    get :destroy_comment
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get "users/auth/google_oauth2/callback", to: "sessions#omniauth"
  get "users/auth/twitter/callback", to: "sessions#twitter"

  # ======================for Api================================== #
    concern :base_api do
      post 'users/register', to: 'users#register'
      post 'users/login', to: 'users#login'
    end

    namespace :api do
      namespace :v1 do
        concerns :base_api
      end   
    end
    
    namespace :api do
      namespace :v1 do
        post 'users/register'
        resources :posts do
          resources :post_likes, only: [:create, :destroy]
          resources :follows, only: [:create, :destroy]
          resources :post_comments, only: [:create , :destroy]
          get :like_unlike
          get :destroy_comment
        end
      end
    end 
 
end
