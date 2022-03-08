Rails.application.routes.draw do

  #devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
   
  #レビューのルーティング
  get 'reviews/about' => 'reviews#about'
  resources :reviews, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
   resource :likes, only: [:create, :destroy]
  end

  #顧客のルーティング
  patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  resources :users, only: [:update, :edit ]
  get 'users/my_page' => 'users#show'
  get 'users/check' => 'users#check'
  get 'users' => redirect("users/sign_in")


  root to:'homes#top'
  get 'homes/about' => 'homes#about'
  get 'search' => 'searches#search'
end