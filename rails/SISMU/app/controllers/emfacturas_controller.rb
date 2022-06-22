class EmfacturasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_emfactura, only: [:show]

  def new
    @emfactura = Emfactura.new
  end

  def show
    @emdetalles = @emfactura.emdetalles
    @emdetalle = Emdetalle.new
    @total = @emfactura.emdetalles.sum(:valor)
  end

  def edit
    @emfactura = Emfactura.find(params[:id])
  end


  def update
    @emfactura = Emfactura.find(params[:id])
    if @emfactura.update(emfactura_params)
      redirect_to emfacturas_path
    else
        render :edit
    end
  end

  def index

    @q = params[:q]
    @emfacturas = Emfactura.all()
    if @q

      @emfacturas = Emfactura.where(:id => @q )
    else
      @emfacturas = Emfactura.all()
    end
    @emfacturas = Emfactura.paginate(:page => params[:page], :per_page => 2)
  end

  def create
    @emfactura = Emfactura.new(emfactura_params)
    if @emfactura.save
      flash[:alert] = "Se creo correctamente."
      redirect_to emfactura_path(@emfactura)
    else
      render :new
    end
  end
def destroy 
  @emfactura = Emfactura.find(params[:id]).destroy
  redirect_to emfacturas_path
end
  private

  def emfactura_params
    params.require(:emfactura).permit(:empresa_id, :fechafin)
  end

  def set_emfactura
    @emfactura = Emfactura.find(params[:id])
  end
end
