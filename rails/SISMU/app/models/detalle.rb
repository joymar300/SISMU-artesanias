class Detalle < ApplicationRecord
  belongs_to :factura
  belongs_to :producto
  has_and_belongs_to_many :colors


  def total
    self.cantidad * producto.precio_pro
  end
end
