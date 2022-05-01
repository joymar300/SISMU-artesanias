Rails.application.routes.draw do
  # CATEGORIA
  resources :categories
  #PRODUCTO
  resources :productos
  #HOME
  root to: "home#index"
  #DEVISE
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
