Rails.application.routes.draw do
  # Root Route
  root 'public#index'

  resources :authors, only: [:index, :show]

  resources :book_genres, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
