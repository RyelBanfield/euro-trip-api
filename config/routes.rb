Rails.application.routes.draw do
  resources :users, only: [:create, :index]
  resources :countries, only: [:index]
  resources :favourites, only: [:create, :index, :destroy]
end
