Rails.application.routes.draw do
  root to: proc { [200, { "Content-Type" => "application/json" }, ['{ "message": "Welcome to My API" }']] }
  use_doorkeeper
  devise_for :users

  namespace :api do
    resources :movies, only: [:index, :show, :create, :update, :destroy]
  end
end
