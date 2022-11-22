Rails.application.routes.draw do

  #resources :posts, only: [:index, :new, :create, :edit, :update]
  resources :posts
  # root "posts#index"

  # resources :users, only: [:new, :create]
  resources :users
  root "users#new"
  # delete "sessions", to: "sessions#destroy"
 
  resources :sessions, only: [:new, :create, :login, :welcome, :destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#destroy'
  get 'authorized', to: 'sessions#page_requires_login'

end


