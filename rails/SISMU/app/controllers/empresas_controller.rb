class EmpresasController < ApplicationController
  before_action :authenticate_user!
  def index
  
    @empresas = Empresa.all
    authorize @empresas
    @q = Empresa.ransack(params[:q])
    
    @empresas= if params[:q]
       @q.result(distinct: true).paginate(:per_page => 20, :page => params[:page])  
      else
        Empresa.search(params[:search]).paginate(:per_page => 20, :page => params[:page])
      end
     
  end

  def show
    @empresa = Empresa.find(params[:id])
    authorize @empresa
  end
  
  def new
    @empresa = Empresa.new
    authorize @empresa
  end

  def create
    @empresa = Empresa.new(empresa_params)
    if @empresa.save 
      flash[:notice] = "Se creo correctamente."
      redirect_to empresas_path
    else
      render :new
    end
  end
  
  def edit
    @empresa = Empresa.find(params[:id])
    authorize @empresa
  end


  def update
    @empresa = Empresa.find(params[:id])
    if @empresa.update(empresa_params)
      flash[:notice] = "Se actualizó correctamente."
      redirect_to empresas_path
    else
        render :edit
    end
  end

  def destroy
    @empresa = Empresa.find(params[:id]).destroy
    redirect_to empresas_path

  end

  private

    def empresa_params
      params.require(:empresa).permit(:id, :nombre,:direccion, :tel , :correo , :ciudad, :barrio)
    end
end
