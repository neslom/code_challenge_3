Rails.application.routes.draw do
  get "/", to: "sessions#new"

  get '/auth/:provider/callback', to: 'sessions#create'

  get "/home", to: "home#index", as: "root"

  resources :users
end
