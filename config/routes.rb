Rails.application.routes.draw do
  root 'items#index'
  
  resources :items
  devise_for :users

  resources :carts, only: [:show] do 
    resources :join_table_cart_items, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :index] do
    resources :orders, only: [:index]
    resources :avatars, only: [:create]
  end

  resources :charges

end
