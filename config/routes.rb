Rails.application.routes.draw do
  root "home#homepage"
  devise_for :users
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "dashboard/:id", to: "home#dashboard", as: :dashboard
end
