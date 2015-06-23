Rails.application.routes.draw do
  get "/", to: "sessions#new"

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users
end
