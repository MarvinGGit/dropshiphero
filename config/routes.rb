Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 unauthenticated do
  as :user do
    root :to => 'devise/registrations#new'
  end
 end
 
  authenticated do
      root :to => 'products#index'
  end

  root 'pages#home'
  get 'dashboard' => 'pages#dashboard'

  get 'contact' => 'pages#contact'
  get 'faq' => 'pages#faq'

  get 'shopify/auth' => 'shopifys#auth'
  get 'shopify/install' => 'shopifys#install'



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
