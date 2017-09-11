Rails.application.routes.draw do
  root 'products#index'

  get '/signup', to: 'users#new'
  
  resources :products, :users
  resources :categories, :photos, only: [:create, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
