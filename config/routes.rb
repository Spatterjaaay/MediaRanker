Rails.application.routes.draw do
  root 'works#index'
  post "/works/:work_id/upvote", to: "works#upvote", as: "upvote"
  # get "/works/:category", to:

  resources :books
  resources :albums
  resources :movies
  resources :works

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"

end
