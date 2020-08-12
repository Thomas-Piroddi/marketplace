Rails.application.routes.draw do
  resources :books
  get 'books/index'
  get 'books/new'
  get 'books/create'
  get 'books/destroy'
  get 'pages/index'
  root 'pages#index'
  get 'pages/account'
  get 'pages/_genres'
  get 'pages/_account_books'
  #devise_for :users_controller
  end
