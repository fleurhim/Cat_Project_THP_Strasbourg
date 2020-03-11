Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  resources :items

  resources :users, only: [:show, :index] do
  	resources :carts, only: [:show]
  	resources :orders, only: [:index]
    resources :avatars, only: [:create]
  end

  resources :charges

end
