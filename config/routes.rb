Rails.application.routes.draw do

  namespace :authentication, path: "", as: "" do
    resources :users, only: [:new, :create], path: "/register", path_names: { new: "/" }
    resources :sessions, only: [:new, :create, :destroy], path: "/login", path_names: { new: "/"}
  end

  resources :favorites, only: [:index, :create, :destroy], param: :product_id

  resources :users, only: :show, path: "/user", param: :username

  resources :categories, except: :show
  resources :products, path: "/"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
