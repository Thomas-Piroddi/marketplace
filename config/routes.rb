Rails.application.routes.draw do

  get 'pages/index'
   
  root 'pages#index'

  get 'pages/account'

  get 'pages/_genres'

  get 'pages/_account_books'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end