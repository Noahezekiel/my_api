Rails.application.routes.draw do
  use_doorkeeper
  # devise_for :users

  namespace :api do
    resources :movies, only: [:index, :show, :create, :update, :destroy]
  end
end
