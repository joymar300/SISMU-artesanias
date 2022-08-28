class ProductosController < ApplicationController
  
  before_action :authenticate_user!
  def index
    @productos= Producto.all
    authorize @productos
    @q = Producto.ransack(params[:q])
    
    @productos = if params[:q]
      @productos = @q.result(distinct: true).paginate(:per_page => 20, :page => params[:page])  
      else
        @productos = Producto.search(params[:search]).paginate(:per_page => 20, :page => params[:page])
      end

   end
  def show
    @producto = Producto.find(params[:id])
    authorize @producto
  end
  
  def new
    @producto = Producto.new
    authorize @producto
  end

  def create
    @producto = Producto.new(producto_params)
    if @producto.save 
      flash[:notice] = "Se creo correctamente."
      redirect_to productos_path
    else
      render :new
    end
  end
  
  def edit
    @producto = Producto.find(params[:id])
    authorize @producto
  end


  def update
    @producto = Producto.find(params[:id])
    if @producto.update(producto_params)
      flash[:notice] = "Se actualizó correctamente."
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
