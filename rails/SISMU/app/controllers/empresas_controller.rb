class EmpresasController < ApplicationController
  before_action :authenticate_user!
  def index
   
    @q = params[:q]
    @empresas = Empresa.all
    if @q
     
      @empresas = Empresa.where(:nombre => @q )
    else
      @empresas = Empresa.all
    end
    @empresas = Empresa.paginate(:page => params[:page], :per_page => 2)
  end

  def show
    @empresa = Empresa.find(params[:id])
  end
  
  def new
    @empresa = Empresa.new
  end

  def create
    @empresa = Empresa.new(empresa_params)
    if @empresa.save 
      flash[:alert] = "Se creo correctamente."
      redirect_to empresas_path
    else
      render :new
    end
  end
  
  def edit
    @empresa = Empresa.find(params[:id])
  end


  def update
    @empresa = Empresa.find(params[:id])
    if @empresa.update(empresa_params)
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
      params.require(:empresa).permit(:id, :nombre,:direccion, :tel)
    end
end
