Rails.application.routes.draw do
  # Root Route
  root 'public#index'

  get "authors/year/:year", to: "authors#year", as: "year"

  resources :authors, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :book_genres, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :books, only: [:index, :show, :new, :create, :edit, :update]
end
