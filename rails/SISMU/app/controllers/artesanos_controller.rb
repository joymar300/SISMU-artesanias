class ArtesanosController < ApplicationController
  before_action :authenticate_user!
  def index
   
  
    @artesanos = Artesano.all()
   
    @artesanos = Artesano.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
  end
  def show
    @artesano = Artesano.find(params[:id])
  end
  
  def new
    @artesano = Artesano.new
  end

  def create
    @artesano = Artesano.new(artesano_params)
    if @artesano.save
      redirect_to artesanos_path
    else
      render :new
    end
  end
  
  def edit
    @artesano = Artesano.find(params[:id])
  end


  def update
    @artesano = Artesano.find(params[:id])
    if @artesano.update(artesano_params)
      redirect_to artesanos_path
    else
        render :edit
    end
  end

  def destroy
    @artesano = Artesano.find(params[:id]).destroy
    redirect_to artesanos_path

  end

  private

    def artesano_params
      params.require(:artesano).permit(:id, :nombre, :snombre, :apellido, :sapellido, :tel)
    end
end
