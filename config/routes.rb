Rails.application.routes.draw do
  resources :roles
  resources :users, path: '/customers', controller: 'customers', only: [:index, :show, :edit, :update]
  get '/account', to: 'accounts#show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
