class Emfactura < ApplicationRecord
  belongs_to :empresa

  has_many :emdetalles, dependent: :destroy
  has_many :productos, through: :emdetalles
  validates_associated :empresa
  def final
    emdetalles.sum(&:valor)
  end
  
end
