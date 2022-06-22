class ProductosController < ApplicationController
  
  before_action :authenticate_user!
  def index
    @q = params[:q]
    @productos = Producto.all
    if @q
      # @productos = Producto.where(:referencia_pro => @q )
      @productos = Producto.where(:nombre_pro => @q )
    else
      @productos = Producto.all
    end
    @productos = Producto.paginate(:page => params[:page], :per_page => 2)
 
  end
  def show
    @producto = Producto.find(params[:id])
  end
  
  def new
    @producto = Producto.new
  end

  def create
    @producto = Producto.new(producto_params)
    if @producto.save 
      flash[:alert] = "Se creo correctamente."
      redirect_to productos_path
    else
      render :new
    end
  end
  
  def edit
    @producto = Producto.find(params[:id])
  end


  def update
    @producto = Producto.find(params[:id])
    if @producto.update(producto_params)
      redirect_to productos_path
    else
        render :edit
    end
  end

  def destroy
    @producto = Producto.find(params[:id]).destroy
    redirect_to productos_path

  end

  private

    def producto_params
      params.require(:producto).permit(:nombre_pro, :precio_pro, :referencia_pro, category_ids:[])
    end
end
