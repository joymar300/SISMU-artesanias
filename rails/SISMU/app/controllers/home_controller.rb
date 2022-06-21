class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @productos= Producto.last(2).reverse
    @artesanos= Artesano.last(2).reverse
    @clients= Client.last(2).reverse
  end
end
