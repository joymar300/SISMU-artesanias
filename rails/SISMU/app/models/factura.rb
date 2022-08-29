class Factura < ApplicationRecord
  belongs_to :client
  has_many :detalles, dependent: :destroy
  has_many :productos, through: :detalles
  validates :fref, presence: { :message => "Este campo es obligatorio"  }
  validates :fref, uniqueness: { :message => "el numero de factura ya está en uso" }

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
     includes(:client).where( ["fref LIKE ? or nombre_cli LIKE ? or apellido_cli LIKE ?  ", "%#{search}%", "%#{search}%", "%#{search}%" ]  ).references(:client)
    else
        unscoped
    end
  end
end
