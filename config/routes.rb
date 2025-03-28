Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  use_doorkeeper
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  # Root Route (Optional Fixes 404 Error when accessing)
  # root to: -> { [200, { "Content-Type" => "application/json" }, ['{"message": "Welcome to the Movie API"}']] }

  # User Management Routes
  resources :users, only: [:index, :update, :destroy]

  # Movie Management Routes
  resources :movies, only: [:index, :create, :update, :destroy]
end
