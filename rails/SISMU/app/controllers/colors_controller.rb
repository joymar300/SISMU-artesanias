class ColorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @colors = Color.all
    authorize @colors
   end
  def show
    @color = Color.find(params[:id])
    authorize @color
  end
  
  def new
    @color = Color.new
    authorize @color
  end

  def create
    @color = Color.new(color_params)
    if @color.save 
      flash[:alert] = "Se creo correctamente."
      redirect_to colors_path
    else
      render :new
    end
  end
  
  def edit
    @color = Color.find(params[:id])
  end


  def update
    @color = Color.find(params[:id])
    if @color.update(color_params)
      redirect_to colors_path
    else
        render :edit
    end
  end

  def destroy
    @color = Color.find(params[:id]).destroy
    redirect_to colors_path

  end

  private

    def color_params
      params.require(:color).permit(:tipo)
    end
end
