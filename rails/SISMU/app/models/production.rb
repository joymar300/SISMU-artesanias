class Production < ApplicationRecord
  has_many :dproductions, dependent: :destroy

    # nuevas validaciones actualizacion version 1.2

  validates :ref, uniqueness: {:message => "«Este número de referencia ya se encuentra en uso»"}
 



  def self.search(search)
    if search
      where( ["id LIKE  ?", "%#{search}%"]  )
    else
        unscoped
    end
  end
end
