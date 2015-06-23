Rails.application.routes.draw do
  get "/", to: "sessions#new"
end
