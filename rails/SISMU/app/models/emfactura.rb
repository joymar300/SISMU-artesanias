class Emfactura < ApplicationRecord
  belongs_to :empresa

  has_many :emdetalles, dependent: :destroy
  has_many :productos, through: :emdetalles
  validates_associated :empresa
  validates :emfref, presence: { :message => "Este campo es obligatorio"  }
  validates :emfref, uniqueness: { :message => "el numero de factura ya está en uso" }
  def final
    emdetalles.sum(&:valor)
  end
  def iva
    self.final*0.19
  end
  def final_total
    self.final + self.iva
  end
  def self.search(search)
    if search
   
      Emfactura.joins(:empresa).where( ["emfref LIKE  ? or nombre LIKE ?","%#{search}%","%#{search}%"])
    else
        unscoped
    end
  end



end
