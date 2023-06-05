Rails.application.routes.draw do

  resources :categories, except: :show
  resources :products, path: "/"

  namespace :authentication do
    resources :users, only: [:new, :create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
