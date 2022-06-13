# frozen_string_literal: true

Rails.application.routes.draw do

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'

  resources :books
  resources :books_loans
  get '/books_loans/:id', to: 'books_loans#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
