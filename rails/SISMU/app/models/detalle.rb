class Detalle < ApplicationRecord
  belongs_to :factura
  belongs_to :producto



  def total
    self.cantidad * producto.precio_pro
  end
end
