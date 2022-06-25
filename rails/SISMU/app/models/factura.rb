class Factura < ApplicationRecord
  belongs_to :client
  has_many :detalles, dependent: :destroy
  has_many :productos, through: :detalles
  # validates_associated :client, presence: {:message=>"Inserte una cliente" }
  def final
    detalles.sum(&:valor)
  end
  def iva
    self.final*0.19
  end
  def final_total
    self.final + self.iva
  end
  def self.search(search)
    if search
      where( ["id LIKE  ?  ", "%#{search}%"]  )
    else
        unscoped
    end
  end
end
