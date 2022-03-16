Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'
  
  devise_for :users
  resources :items
  resources :carts
end
