Rails.application.routes.draw do
  root 'products#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resource :cart, only: :show
  resources :sessions, only: [:new, :create, :destroy]
  resources :order_items, only: [:create, :update, :destroy]
  resources :products, :users
  resources :categories, :photos, only: [:create, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
