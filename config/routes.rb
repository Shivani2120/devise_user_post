Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :post_attachments
  devise_for :users

  resources :posts do
    resources :post_likes, only: [:create, :destroy]
  end
  
  resources :posts do
    resources :follows, only: [:create, :destroy]
    get :like_unlike
    get :like_by_users
  end
    
  resources :posts do
    resources :post_comments, only: [:create , :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get "/auth/google_oauth2/callback", to: "sessions#omniauth"
end
