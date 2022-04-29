Rails.application.routes.draw do
  # CATEGORIA
  get 'category/index'
  get 'category/show'
  get 'category/edit'
  get 'category/new'
  get 'category/update'
  #PRODUCTO
  get 'producto/index'
  get 'producto/show'
  get 'producto/edit'
  get 'producto/new'
  get 'producto/update'
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
