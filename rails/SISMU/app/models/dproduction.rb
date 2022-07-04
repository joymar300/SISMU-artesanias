class Dproduction < ApplicationRecord
  belongs_to :production
  belongs_to :producto
  belongs_to :artesano
  validates_associated :production, :producto , :artesano

  validates :cantidad, presence: {:message => "Campo Obligatorio"}
  validates :cantidad, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 99999999999, :message => "«No se permiten números negativos»"  }

  # validates :cantidad, presence: {:message => "inserte una cantidad"}, numericality: { greater_than: 0}


  # validates :dproduction.producto.nombre_pro, :dproduction.producto.precio_pro, 
  # :dproduction.cantidad, :dproduction.artesano.nombre_completo, presence: {:message => "requeridos"}
end
