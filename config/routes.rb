Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get 'static_pages/about'
  get 'static_pages/contact'

  #YR 16.03.2022 - Route for the Activemailer with the Gem letterOpenerWeb
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  devise_for :users
  resources :customers
  resources :items
  resources :carts

  # JBV 17.03.2022 - Adding STRIPE dedicated routes (NB: to be digged up what this scope is all about...?)
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
    get "success", to: "checkout#success", as: "checkout_success"
  end

end
