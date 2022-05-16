class FacturasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_factura, only: [:show]

  def new
    @factura = Factura.new
  end

  def show
    @productos = @factura.productos
    @detalle = Detalle.new
    @total = @factura.detalles.sum(:valor)
  end

  def edit
  end

  def index
    @facturas = Factura.all()
  end

  def create
    @factura = Factura.new(factura_params)
    if @factura.save
      redirect_to factura_path(@factura)
    else
      render :new
    end
  end

  private

  def factura_params
    params.require(:factura).permit(:client_id)
  end

  def set_factura
    @factura = Factura.find(params[:id])
  end
end
