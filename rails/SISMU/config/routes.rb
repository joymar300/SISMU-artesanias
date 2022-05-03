Rails.application.routes.draw do
  get 'productos/index'
  get 'productos/new'
  get 'productos/edit'
  get 'productos/update'
  get 'categories/index'
  get 'categories/new'
  get 'categories/edit'
  get 'categories/update'
  # CATEGORIA
  resources :categories do
    resources :categories_productos, module: :categories
  end
  #PRODUCTO
  resources :productos do
    resources :categories_productos,module: :productos
  end
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
