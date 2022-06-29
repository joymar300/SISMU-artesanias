class ClientsController < ApplicationController
  before_action :authenticate_user!
  def index
    @clients = Client.all
    authorize @clients
    @q = Client.ransack(params[:q])
    
    @clients = if params[:q]
       @q.result(distinct: true).paginate(:per_page => 20, :page => params[:page])  
      else
        Client.search(params[:search]).paginate(:per_page => 20, :page => params[:page])
      end
  end
  
  def show
    @client = Client.find(params[:id])
    authorize @client
  end
  
  def new
    @client = Client.new
    authorize @client

  end

  def create
    @client = Client.new(client_params)
    if @client.save 
      flash[:notice] = "Se creó correctamente."
      redirect_to clients_path
    else
      render :new
    end
  end
  
  def edit
    @client = Client.find(params[:id])
    authorize @client
  end


  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      flash[:notice] = "Se actualizó correctamente."
      redirect_to clients_path
    else
        render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id]).destroy
    redirect_to clients_path

  end

  private

    def client_params
      params.require(:client).permit(:id,:nombre_cli, :nombre2_cli, :apellido_cli, :apellido2_cli, :tel_cli, :correo_cli,:cedula_cli,:direccion_cli)
    end
end
