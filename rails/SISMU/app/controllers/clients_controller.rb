class ClientsController < ApplicationController
  before_action :authenticate_user!
  def index
    @clients = Client.all
   
    @clients = Client.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
  end
  def show
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save 
     
      redirect_to clients_path
    else
      render :new
    end
  end
  
  def edit
    @client = Client.find(params[:id])
  end


  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
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
