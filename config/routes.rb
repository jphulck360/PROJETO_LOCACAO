Rails.application.routes.draw do
  
  resources :clients
  get 'users/index'
  get 'visitors/index'
  get 'vehicles/mostrar'
  get 'vehicles/mostrar_modelo'
  get 'locations/relatorio'

  resources :locations
  resources :vehicles
  resources :marks
  resources :model_cars
  resources :visitors

  root to: 'visitors#index' # Página inicial

  devise_for :users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
