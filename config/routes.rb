Rails.application.routes.draw do
  get "/", to: "sessions#new"

  get '/auth/:provider/callback', to: 'sessions#create'

  get "/home", to: "home#index", as: "root"

  resources :users, only: [:edit, :update]

  get "/matches", to: "matches#index"

  put "/matches", to: "matches#update"

  delete "/logout", to: "sessions#destroy", as: "logout"

  get "/pairs", to: "pairs#index"
end
