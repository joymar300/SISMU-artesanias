class FacturasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_factura, only: [:show]

  def new
    @factura = Factura.new
  end

  def show
    @detalles = @factura.detalles
    @detalle = Detalle.new
    @color = Color.new
    @total = @factura.detalles.sum(:valor)
  end

  def edit
    @factura = Factura.find(params[:id])
  end


  def update
    @factura = Factura.find(params[:id])
    if @factura.update(factura_params)
      redirect_to facturas_path
    else
        render :edit
    end
  end

  def index
   

    @facturas = Factura.all()
    @facturas = Factura.search(params[:search]).paginate(:per_page => 2, :page => params[:page])
  end

  def create
    @factura = Factura.new(factura_params)
    if @factura.save
      flash[:alert] = "Se creo correctamente."
      redirect_to factura_path(@factura)
    else
      render :new
    end
  end
def destroy 
  @factura = Factura.find(params[:id]).destroy
  redirect_to facturas_path
end
  private

  def factura_params
    params.require(:factura).permit(:client_id, :fechafin)
  end

  def set_factura
    @factura = Factura.find(params[:id])
  end
end
