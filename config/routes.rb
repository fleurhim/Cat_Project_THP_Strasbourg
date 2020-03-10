Rails.application.routes.draw do
  devise_for :users
  resources :items
  root 'items#index'
  resources :users, only: [:show, :index] do
    resources :avatars, only: [:create]
  	resources :carts, only: [:show]
  end
end
