Rails.application.routes.draw do
  get 'colors/index'
  get 'colors/new'
  get 'colors/create'
  get 'colors/show'


  # Clientes
  resources :clients
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
  end
  # PEDIDOS CLIENTES
  resources :facturas do
    resources :detalles, module: :facturas, only: [:create]
  end
  #colors
  resources :colors
  
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
