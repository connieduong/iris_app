Rails.application.routes.draw do

  root 'users#index'

  resources :users
  resources :posts
  resources :comments

  post 'posts/:post_id/comments' => 'comments#create', as: :post_comments

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout



end
