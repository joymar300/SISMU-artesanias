class MaterialsController < ApplicationController
  before_action :authenticate_user!
  def index
    @materials = Material.all
  end
  def show
    @material = Material.find(params[:id])
  end
  
  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.save 
      flash[:alert] = "Se creo correctamente."
      redirect_to materials_path
    else
      render :new
    end
  end
  
  def edit
    material = Material.find(params[:id])
  end


  def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      redirect_to materials_path
    else
        render :edit
    end
  end

  def destroy
    @material = Material.find(params[:id]).destroy
    redirect_to materials_path

  end

  private

    def material_params
      params.require(:material).permit(:tipo_material)
    end
end
