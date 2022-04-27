Rails.application.routes.draw do
  get 'category/index'
  get 'category/show'
  get 'category/edit'
  get 'category/new'
  get 'category/update'
  get 'producto/index'
  get 'producto/show'
  get 'producto/edit'
  get 'producto/new'
  get 'producto/update'
  root to: "home#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
