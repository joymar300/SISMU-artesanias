class Productions::DproductionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_production

  def create
      @dproduction = @production.dproductions.new(dproduction_params)
      @dproduction.save!
      redirect_to production_path(@production)       
  end
  def destroy 
      @dproduction = @production.dproduction.find(params[:id]).destroy
      redirect_to production_path(@production)
    end
    def destroy
      @dproduction = @production.dproductions.find(params[:id ])
      @dproduction.destroy
      redirect_to production_dproduction_path
    end
  private

  def dproduction_params
      params.require(:dproduction).permit(:producto_id, :cantidad, :artesano_id)
  end

  def set_production
      @production = Production.find(params[:production_id])
  end
end
