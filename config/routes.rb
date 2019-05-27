Rails.application.routes.draw do
  # Root Route
  root 'public#index'

<<<<<<< HEAD
  resources :authors, only: [:index, :show]

  resources :book_genres, only: [:index, :show, :new, :create, :edit, :update, :destroy]
=======
  resources :authors, only: [:index, :show, :new, :create]
>>>>>>> 6e7522970466399334671450405fb98853a2026b
end
