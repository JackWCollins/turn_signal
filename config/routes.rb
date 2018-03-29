Rails.application.routes.draw do
  resources :makes
  resources :models
  resources :vehicles
  resources :options
  resources :vehicle_options, only: [:create, :destroy]
  resources :model_options, only: [:create, :destroy]
end
