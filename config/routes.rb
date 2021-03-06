Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" => 'homes#about'
  get 'search' => 'search#search'
  resources :books, only: [:create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
