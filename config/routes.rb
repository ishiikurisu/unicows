Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  get 'main/about', to: 'main#about'
  get 'products/list', to: 'products#list'
  get 'products/show', to: 'products#show'
  get 'products/not_found', to: 'products#not_found'
end
