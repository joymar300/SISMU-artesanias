Rails.application.routes.draw do
  namespace :productions do
    get 'dproductions/create'
    get 'dproductions/index'
  end
  get 'artesanos/index'
  get 'artesanos/new'
  get 'artesanos/show'
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
    resources :detalles, module: :facturas, only: [:create ,:destroy]
  end
  #colors
  resources :colors
  
  #artesanos
  resources :artesanos
  #produccion
  resources :productions do
    resources :dproductions, module: :productions, only:[:create, :destroy]
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
