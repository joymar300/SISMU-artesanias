class Production < ApplicationRecord
  has_many :dproductions, dependent: :destroy

    # nuevas validaciones actualizacion version 1.2

  validates :ref, numericality: { only_integer: true,  :message => "«Se permiten solo Numeros»"}
  validates :ref, uniqueness: {:message => "«Este número de referencia ya se encuentra en uso»"}
  validates :ref, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 99999999999, :message => "«No se permiten números negativos»"  }



  def self.search(search)
    if search
      where( ["id LIKE  ?", "%#{search}%"]  )
    else
        unscoped
    end
  end
end
