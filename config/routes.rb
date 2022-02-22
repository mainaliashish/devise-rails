Rails.application.routes.draw do
  root "home#homepage"
  devise_for :users
  resources :posts

  get "dashboard/:id", to: "home#dashboard", as: :dashboard
end
