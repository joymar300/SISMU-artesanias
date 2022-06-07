class EmpresasController < ApplicationController
  before_action :authenticate_user!
  def index
    @empresas = Empresa.all
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
