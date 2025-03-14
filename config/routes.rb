Rails.application.routes.draw do
  # Root path route
  get("/", to: "places#index")

  # Resources for entries, places, sessions, and users
  resources :entries
  resources :places
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  # Custom routes for login, logout, and signup
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"
end
