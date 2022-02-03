Rails.application.routes.draw do
  root "home#homepage"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
    member do
      get 'users/edit/:id', to: 'users#edit', as: :edit_user
      get 'users/delete/:id', to: 'users#delete'
    end
  end
  resources :posts
  resources :users

  get "dashboard", to: "home#dashboard", as: :dashboard
end
