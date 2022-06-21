class Empresa < ApplicationRecord
    has_many :emfacturas, dependent: :destroy
    validates :id, :nombre, :direccion, :tel, presence: {:message => "Requeridos"}
    validates :id, uniqueness: {:message => "NIT Único"}
    validates :id, numericality: { only_integer: true }
    def empresa_busqueda
        "#{id}- #{nombre}"
    end
end
