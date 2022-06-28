class Detalle < ApplicationRecord
  belongs_to :factura
  belongs_to :producto
  has_and_belongs_to_many :colors, dependent: :destroy
  validates_associated :producto
  validates :cantidad, presence: {:message => "inserte una cantidad"}, numericality: { greater_than: 0}
  before_save :total
  before_save :guardar_pasado
  def total
   self.valor= self.cantidad * producto.precio_pro
  end
  def guardar_pasado
    self.precio= producto.precio_pro
    
  end
  
end
