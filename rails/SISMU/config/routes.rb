Rails.application.routes.draw do
  namespace :emfacturas do
    get 'emdetalles/create'
  end
  get 'emfacturas/index'
  get 'emfacturas/show'
  get 'emfacturas/new'

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

  # PEDIDOS FACTURAS
  resources :facturas do
    resources :detalles, module: :facturas, only: [:create ,:destroy]
  end
  
  #colors
  resources :colors

  resources :profiles

  #artesanos
  resources :artesanos
  
  #produccion
  resources :productions do
    resources :dproductions, module: :productions, only:[:create, :destroy]
  end
 
  #empresas
  resources :empresas

  #facturas empresas

  resources :emfacturas do
    resources :emdetalles, module: :emfacturas, only:[:create, :destroy]
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
