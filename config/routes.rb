Rails.application.routes.draw do
  get "admin/index"
  root "pages#index"
  get "/home", to: "pages#index"
  get "/pages/:pagename", to: "pages#page", as: "pages"
  get "/signup", to: "registers#new"
  post "/signup", to: "registers#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :users
  namespace :admin do
    resources :users
  end
end
