Rails.application.routes.draw do
  devise_for :users
  get "admin/index"
  get "/home", to: "page#home"
  get "/help", to: "page#help"
  get "/profile", to: "page#profile"
  get "/settings", to: "page#settings"

  root "pages#index"
  get "/home", to: "pages#index"
  get "/pages/:pagename", to: "pages#page", as: "pages"
  # get "/signup", to: "registers#new"
  # post "/signup", to: "registers#create"
  # get "/login", to: "sessions#new"
  # post "/login", to: "sessions#create"
  # get "/logout", to: "sessions#destroy"
  # devise_for :users
  resources :users
  resources :suggest_products
  resources :products
  resources :orders
  resources :catalogs
  resources :ratings
  namespace :admin do
    resources :users
    resources :orders
    resources :suggest_products
    resources :catalogs
    resources :products do
      collection do
        post :import
      end
    end
  end
end
