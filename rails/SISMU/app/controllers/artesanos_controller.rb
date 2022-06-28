class ArtesanosController < ApplicationController
  before_action :authenticate_user!
  def index
   
  
    @artesanos = Artesano.all()
    authorize @artesanos
    @q = Artesano.ransack(params[:q])
    
    @artesanos= if params[:q]
       @q.result(distinct: true).paginate(:per_page => 20, :page => params[:page])  
      else
        Artesano.search(params[:search]).paginate(:per_page => 20, :page => params[:page])
      end

  end
  def show
    @artesano = Artesano.find(params[:id])
    authorize @artesano
  end
  
  def new
    @artesano = Artesano.new
    authorize @artesano
  end

  def create
    @artesano = Artesano.new(artesano_params)
    if @artesano.save
      flash[:notice] = "Se creo correctamente."
      redirect_to artesanos_path
    else
      render :new
    end
  end
  
  def edit
    @artesano = Artesano.find(params[:id])
    authorize @artesano
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
