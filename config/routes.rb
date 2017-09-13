Rails.application.routes.draw do
  devise_for :users
  get "admin/index"
  get "/home", to: "page#home"
  get "/help", to: "page#help"
  get "/profile", to: "page#profile"
  get "/settings", to: "page#settings"

  root "products#index"
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
  resources :static_pages
  resources :products do
    collection do
       get "/catalog/:cat_id", to: "products#catalog", as: "catalog"
    end
  end
  resources :orders
  resources :catalogs
  resources :ratings
  resources :order_details
  resources :carts
  resources :items

  namespace :admin do
    resources :users
    resources :orders
    resources :suggest_products
    resources :catalogs
    resources :static_pages
    resources :payments
    resources :feedbacks

    resources :products do
      collection do
        post :import
      end
    end
  end
end
