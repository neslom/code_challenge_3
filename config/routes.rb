Rails.application.routes.draw do
  get "/", to: "sessions#new"

  resources :users
end
