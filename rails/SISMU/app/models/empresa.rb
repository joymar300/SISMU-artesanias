class Empresa < ApplicationRecord
    has_many :emfacturas, dependent: :destroy
    validates :id, :nombre, :direccion,:ciudad, :barrio, :tel, presence: {:message => "Requeridos"}
    validates :id, uniqueness: {:message => "NIT Único"}
    validates :id, numericality: { only_integer: true }
    def empresa_busqueda
        "#{id}- #{nombre}"
    end
    def self.search(search)
        if search
          where( ["id LIKE  ? or nombre LIKE ? ", "%#{search}%","%#{search}%"]  )
        else
            unscoped
        end
      end
end
