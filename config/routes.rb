Rails.application.routes.draw do
  devise_for :users
  get 'memos/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms
end
