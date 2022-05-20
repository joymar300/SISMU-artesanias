class ClientProductosController < ApplicationController  
  before_action :authenticate_user!
  def index
    @pedidos = ClientProducto.all
  end
  def show
    @pedido = ClientProducto.find(params[:id])
  end
  
  def new
    @pedido = ClientProducto.new
  end

  def create
    @pedido = ClientProducto.new(pedido_params)
    if @pedido.save 
      redirect_to pedidos_path
    else
      render :new
    end
  end
  
  def edit
    pedido = ClientProducto.find(params[:id])
  end


  def update
    @pedido = ClientProducto.find(params[:id])
    if @pedido.update(pedido_params)
      redirect_to pedidos_path
    else
        render :edit
    end
  end

  def destroy
    @pedido = ClientProducto.find(params[:id]).destroy
    redirect_to pedidos_path

  end

  private

    def pedido_params
      params.require(:pedido).permit(:nombre_pedido, :precio_pedido, :cantidad_pedido,:direccion_pedido, producto_ids:[], client_ids:[])
    end
end
