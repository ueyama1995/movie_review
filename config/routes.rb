Rails.application.routes.draw do

  #レビューのルーティング
  resources :reviews

  #映画のルーティング
  resources :movies

  #顧客のルーティング
  patch 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  resources :customers, only: [:update, :edit, :update ]
  get 'customers/my_page' => 'customers#show'
  get 'customers' => 'customers#check'

  devise_for :users

  root to:'homes#top'
  get 'homes/about' => 'homes#about'
end