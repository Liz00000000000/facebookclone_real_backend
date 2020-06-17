Rails.application.routes.draw do
  resources :replies, only: [:index, :new, :create, :destroy ]
  resources :friends, only: [:index, :new, :create, :destroy ]
  resources :likes, only: [:index, :new, :create, :destroy ]
  resources :comments, only: [:index, :new, :create, :destroy ]
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'user#login'
end
