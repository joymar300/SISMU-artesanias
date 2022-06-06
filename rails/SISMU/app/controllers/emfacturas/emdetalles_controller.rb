class Emfacturas::EmdetallesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_emfactura

  def create
      @emdetalle = @emfactura.emdetalles.new(emdetalle_params)
      @emdetalle.save!
      redirect_to emfactura_path(@emfactura)       
  end
  def destroy 
      @emdetalle = @emfactura.emdetalles.find(params[:id]).destroy
      redirect_to emfactura_path(@emfactura)   
  end
    
  private

  def emdetalle_params
      params.require(:emdetalle).permit(:producto_id, :cantidad, :valor, :color_id, :fechafin)
  end

  def set_emfactura
      @emfactura = Emfactura.find(params[:emfactura_id])
  end
end
