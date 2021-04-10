Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:new, :create, :index, :show, :edit]
end