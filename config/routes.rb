Rails.application.routes.draw do

  post "/works/:work_id/upvote", to: "works#upvote", as: "upvote"
  # get "/works/:category", to:

  resources :books
  resources :movies
  resources :albums
  resources :works

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"

end
