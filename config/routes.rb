Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  #レビューのルーティング
  resources :reviews, only: [:new, :create, :index, :show, :destroy, :edit]
  resource :likes, only: [:create, :destroy]

  #映画のルーティング
  resources :movies

  #顧客のルーティング
  patch 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  resources :customers, only: [:update, :edit ]
  get 'customers/my_page' => 'customers#show'
  get 'customers' => 'customers#check'

  devise_for :users

  root to:'homes#top'
  get 'homes/about' => 'homes#about'
end