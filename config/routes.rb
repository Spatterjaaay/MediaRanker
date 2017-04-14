Rails.application.routes.draw do

  post "/works/:work_id/upvote", to: "works#upvote", as: "upvote"

  resources :works
  resources :books
  resources :movies
  resources :albums

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/login", to: "sessions#logout"

end
