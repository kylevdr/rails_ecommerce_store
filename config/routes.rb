Rails.application.routes.draw do
  get 'sessions/new'

  root 'products#index'
  
  resources :products, :users
  resources :categories, :photos, only: [:create, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
