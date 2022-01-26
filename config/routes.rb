Rails.application.routes.draw do
  root "home#homepage"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :posts

  get "dashboard/:id", to: "home#dashboard", as: :dashboard
end
