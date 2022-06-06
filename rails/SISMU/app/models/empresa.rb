class Empresa < ApplicationRecord
    has_many :emfacturas, dependent: :destroy
    def empresa_busqueda
        "#{id}- #{nombre}"
    end
end
