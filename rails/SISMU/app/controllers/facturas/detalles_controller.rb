class Facturas::DetallesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_factura

    def create
        @detalle = @factura.detalles.new(detalle_params)
        @detalle.save!
        redirect_to factura_path(@factura)       
    end
    def destroy 
        @detalle = @factura.detalle.find(params[:id]).destroy
        redirect_to factura_path(@factura)   
      end
      def destroy
        @detalle = @factura.detalles.find(params[:id ])
        @detalle.destroy
        redirect_to factura_detalle_path
      end
    private

    def detalle_params
        params.require(:detalle).permit(:producto_id, :cantidad, :valor, color_ids:[])
    end

    def set_factura
        @factura = Factura.find(params[:factura_id])
    end
end
