class Detalle < ApplicationRecord
  belongs_to :factura
  belongs_to :producto
  has_and_belongs_to_many :colors
  before_save :total
  before_save :guardar_pasado
  def total
   self.valor= self.cantidad * producto.precio_pro
  end
  def guardar_pasado
    self.precio= producto.precio_pro
    
  end
  
end
