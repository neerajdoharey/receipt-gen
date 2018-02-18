Rails.application.routes.draw do

  root "dashboard#index"
  
  get 'login',to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'

  resources :products
  resources :orders
  resources :customers
  resources :taxes

  get 'customers/find_by_phone/:phone_no' => 'customers#find_by_phone'

  resources :users, only: [ :edit, :update] 
  # get '/users/:id/edit', to: 'users#edit', as: 'preferences'

  # resources :users, only: [:update ,:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
