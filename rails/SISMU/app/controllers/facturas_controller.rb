class FacturasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_factura, only: [:show]

  def new
    @factura = Factura.new
    authorize @factura
  end

  def show
    @detalles = @factura.detalles
    authorize @factura
    @detalle = Detalle.new
    @color = Color.new
    @total = @factura.detalles.sum(:valor)
    respond_to do |format|
      format.html
      format.pdf do
        render template: "facturas/factura", pdf: "factura-cliente -#{@factura.id}" ,layout:"pdf" # Excluding ".pdf" extension.
      end
    end
  end

  def edit
    @factura = Factura.find(params[:id])
    authorize @factura
  end


  def update
    @factura = Factura.find(params[:id])
    if @factura.update(factura_params)
      flash[:notice] = "Se actualizó correctamente."
      redirect_to facturas_path
    else
        render :edit
    end
  end

  def index
    @facturas = Factura.all()
    
    authorize @facturas
    @q = Factura.ransack(params[:q])
    
    @facturas = if params[:q]
       @q.result(distinct: true).paginate(:per_page => 20, :page => params[:page])  
      else
        Factura.search(params[:search]).paginate(:per_page => 20, :page => params[:page]) 
      end

  end

  def create
    @factura = Factura.new(factura_params)
    if @factura.save
      flash[:notice] = "Se creo correctamente."
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
