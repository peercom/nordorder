Nordorder::Application.routes.draw do
  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "store", to: "pages#store", as: "store"
  
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
    resources :products
  end
  
  namespace :fulfillment do
    root "base#index"
    resources :carts do
      patch :revert, on: :member
      patch :mark_as_processing, on: :member
      patch :mark_as_fulfilled, on: :member
    end
  end
  
  resources :products
  resources :carts do
    patch :confirm, on: :member
  end
  
end
