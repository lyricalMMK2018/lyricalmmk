Rails.application.routes.draw do
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
 }
  root to: 'items#index'
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :orders, only: [:index, :create]
  # get '' => 'items#index', as: :items
  get '/item/:id' => 'items#show', as: :item
  get '/myPage' => 'users#show', as: :user
  #get '/basket' => 'carts#index', as: :basket
  #get '/purchase_history' => 'orders#index', as: :purchase_histroy
  match 'search' => 'items#search', via: [:get, :post], as: :search_items
  #resources :items, only: :show do
   # collection do
   #   match 'search' => 'item#search', via: [:get, :post], as: :search
   # end
  #end
end
