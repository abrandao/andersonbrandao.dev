Rails.application.routes.draw do
  root 'welcome#index'
  resources :posts
  resources :tags, only: [:index, :create, :new, :show, :destroy]
end