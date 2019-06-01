Rails.application.routes.draw do
  # Root Route
  root 'public#index'

  get "authors/year/:year", to: "authors#year", as: "year"

  resources :authors, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :books, only: [:index, :show, :new, :edit]
  end
  
  resources :book_genres, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :books, only: [:index, :show, :new, :create, :edit, :update]

  get "/visitor/welcome", to: "public#welcome", as: "welcome"

  namespace :visitor do
    resources :public, only: [:index]
  end
end
