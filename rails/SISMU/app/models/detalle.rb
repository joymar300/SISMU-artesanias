class Detalle < ApplicationRecord
  belongs_to :factura
  belongs_to :producto

  #after_save :actualizar_total

  def actualizar_total
    self.valor = self.cantidad * producto.precio_pro
    save
  end
end
