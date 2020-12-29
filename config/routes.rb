Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts
  resources :likes, only: %i[create destroy]
  resources :comments, only: %i[create]
end
