class Factura < ApplicationRecord
  belongs_to :client
  has_many :detalles, dependent: :destroy
  has_many :productos, through: :detalles

  def final
    detalles.sum(&:valor)
  end
end
