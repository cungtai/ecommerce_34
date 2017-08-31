Rails.application.routes.draw do
  get "admin/index"
  root "pages#index"
  get "/home", to: "pages#index"
  get "/pages/:pagename", to: "pages#page", as: "pages"
end
