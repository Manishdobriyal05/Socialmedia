Rails.application.routes.draw do
  resources :follows, only: [:create, :destroy]

  #resources :posts, only: [:index, :new, :create, :edit, :update]
  resources :posts do
    resources :comments
  end
  # root "posts#index"

  # resources :users, only: [:new, :create]
  resources :users
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  
 
  resources :sessions, only: [:new, :create, :login, :welcome, :destroy]
  root "sessions#new"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#destroy'
  get 'authorized', to: 'sessions#page_requires_login'

end




