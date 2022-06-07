class Emdetalle < ApplicationRecord
  belongs_to :emfactura
  belongs_to :producto
  before_save :cargar_dato
  before_save :cargar_precio
  has_and_belongs_to_many :colors

  def cargar_dato
    self.valor= self.cantidad * producto.precio_pro
  end

  def cargar_precio
    self.precio = producto.precio_pro
    
  end
  
end
