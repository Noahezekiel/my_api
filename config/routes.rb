Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  use_doorkeeper
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }



  # Root Route (Optional fix for 404 Error)
  root to: -> { [200, { "Content-Type" => "application/json" }, ['{"message": "Welcome to the Movie API"}']] }


  # User Management Routes
  get "/users", to: "users#index"
  put "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  # User Management Routes
  resources :users, only: [:index, :update, :destroy]

  # Movie Management Routes
  resources :movies, only: [:index, :create, :update, :destroy]
end
