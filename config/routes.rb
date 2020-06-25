Rails.application.routes.draw do
  get 'tags/index'
  root 'welcome#index'
  resources :tags, only: [:index, :create, :new, :show, :destroy]
end