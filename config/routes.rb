Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations'}
  root to: 'items#index'
  # get '' => 'items#index', as: :items
  get '/item/:id' => 'items#show', as: :item
  get '/myPage' => 'users#show', as: :user
  get '/basket' => 'carts#index', as: :carts
  get '/purchase_history' => 'orders#index', as: :orders
  match 'search' => 'item#search', via: [:get, :post], as: :search_items
  #resources :items, only: :show do
   # collection do
   #   match 'search' => 'item#search', via: [:get, :post], as: :search
   # end
  #end
  resources :carts, only: [:create, :update, :destroy]
  resources :orders, only: [:create]
end
