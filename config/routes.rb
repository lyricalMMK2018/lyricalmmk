Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => { :registrations => 'users/registrations'}
  root :to => 'items#index'
  get '/:id' => 'items#show'
  get '/myPage' => 'users#show'
  get '/cart' => 'carts#index'
  get '/purchase_history' => 'orders#index'
  resources :items, only: [:index, :show]
  resources :users, only: :show
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :orders, only: [:index, :create]
end
