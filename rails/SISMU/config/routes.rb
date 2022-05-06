Rails.application.routes.draw do
  # MATERIALES
  resources :materials do
    resources :materials_productos, module: :materials
  end

  # CATEGORIA
  resources :categories do
    resources :categories_productos, module: :categories
  end
  #PRODUCTO
  resources :productos do
    resources :categories_productos,module: :productos
    resources :materials_productos, module: :productos
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
