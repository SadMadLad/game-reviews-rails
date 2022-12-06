Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "games#index"

  resources :games do
    resources :comments, only: [:create, :destroy, :show]

    patch :like, on: :member
    patch :dislike, on: :member
    get :search, on: :collection
  end
end
