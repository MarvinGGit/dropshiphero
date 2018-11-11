Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'dashboard' => 'pages#dashboard'

  resources :products
  resources :categories
  resources :charges

  get 'unsubscribe', to: 'charges#endsubscription'

  get 'subscribe', to: 'charges#new'
  get 'profile', to: 'pages#profile'

  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
