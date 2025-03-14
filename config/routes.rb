Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })

  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/users" => "users#create"
end
