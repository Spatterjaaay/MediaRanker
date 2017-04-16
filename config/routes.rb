Rails.application.routes.draw do
  root 'works#index'
  post "/works/:work_id/upvote", to: "works#upvote", as: "upvote"

  resources :books, only: [:index, :new, :create]
  resources :albums, only: [:index, :new, :create]
  resources :movies, only: [:index, :new, :create]
  resources :users, only: [:index, :show]
  resources :works

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"

end
