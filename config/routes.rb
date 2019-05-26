Rails.application.routes.draw do
  # Root Route
  root 'public#index'

  resources :authors, only: [:index, :show]
end
