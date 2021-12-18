Rails.application.routes.draw do

  #devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'relationships/followings'
  get 'relationships/followers'
  #レビューのルーティング
  resources :reviews, only: [:new, :create, :index, :show, :destroy, :edit, :update]

  resource :likes, only: [:create, :destroy]

  #映画のルーティング
  resources :movies

  #顧客のルーティング
  patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  resources :users, only: [:update, :edit ]
  get 'users/my_page' => 'users#show'
  get 'users' => 'users#check'


  root to:'homes#top'
  get 'homes/about' => 'homes#about'
end