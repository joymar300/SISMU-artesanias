class Empresa < ApplicationRecord
    has_many :emfacturas, dependent: :destroy
    validates :id, :nombre, :direccion, :tel, presence: {:message => "requeridos"}
    validates :id, uniqueness: {:message => "nit unico"}
    def empresa_busqueda
        "#{id}- #{nombre}"
    end
end
