Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  resources :items

  resources :users, only: [:show, :index] do
    resources :avatars, only: [:create]
    resources :carts, only: [:show]
  end

  resources :charges
end
