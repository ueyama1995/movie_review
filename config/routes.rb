Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/edit'
  get 'movies/index'
  get 'movies/show'
  get 'customers/show'
  get 'customers/check'
  get 'customers/edit'
  devise_for :users
  root to:'homes#top'
end