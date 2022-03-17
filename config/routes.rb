Rails.application.routes.draw do
  root to: 'static_pages#home'
  # YR 16.03.2022
  resources :items 

  get 'static_pages/about'
  get 'static_pages/contact'

  #YR 16.03.2022 - For the show page, if we do not use resources 
  #get 'static_pages/:id'
  
  #YR 16.03.2022 - Route for the Activemailer with the Gem letterOpenerWeb
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  devise_for :users
  resources :items
  resources :carts
end
