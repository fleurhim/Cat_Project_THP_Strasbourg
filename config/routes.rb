Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :items
  resources :users, only: [:show, :index] do
  	resources :carts, only: [:show]
  end
end
