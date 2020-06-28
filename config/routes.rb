Rails.application.routes.draw do
  root 'welcome#index'
  resources :posts
  resources :tags, only: [:index, :create, :new, :show, :destroy]

  # Auth
  get 'registrar', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
end