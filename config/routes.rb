Rails.application.routes.draw do

  resources :works
  resources :books
  resources :movies
  resources :albums

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/login", to: "sessions#logout"

end
