Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :post_attachments
  devise_for :users#controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :posts do
    resources :post_likes, only: [:create, :destroy]
  end
  
  resources :posts do
    resources :follows, only: [:create, :destroy]
    get :like_unlike
    get :destroy_comment
  end
    
  resources :posts do
    resources :post_comments, only: [:create , :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get "users/auth/google_oauth2/callback", to: "sessions#omniauth"
  get "users/auth/twitter/callback", to: "sessions#twitter"
end
