class Dproduction < ApplicationRecord
  belongs_to :production
  belongs_to :producto
  belongs_to :artesano
  validates_associated :production, :producto , :artesano



  # validates :dproduction.producto.nombre_pro, :dproduction.producto.precio_pro, 
  # :dproduction.cantidad, :dproduction.artesano.nombre_completo, presence: {:message => "requeridos"}
end
