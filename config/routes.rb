Rails.application.routes.draw do
  root "posts#index"
  
  devise_for :users, only: %i[sessions registrations passwords]
  resources :users, only: %i[show], param: :username

  resources :posts, only: %i[index show new edit]
  resources :likes, only: %i[create destroy]
  resources :comments, only: %i[create]
end
