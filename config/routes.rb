Rails.application.routes.draw do
  root 'products#index'
  
  get 'products/show'

  get 'products/index'

  get 'products/new'

  get 'products/edit'

  get 'category/create'

  get 'category/update'

  get 'category/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
