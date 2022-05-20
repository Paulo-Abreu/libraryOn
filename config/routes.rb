Rails.application.routes.draw do
  
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

    namespace :api do
    namespace :v1 do
      resources :books
      get '/books', to: 'books#index'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
