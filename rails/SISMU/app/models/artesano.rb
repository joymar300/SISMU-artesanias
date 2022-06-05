class Artesano < ApplicationRecord
    has_many :dproductions, dependent: :destroy
    has_many :production, through: :dproductions

    def nombre_completo
        "#{cedula}- #{nombre} #{apellido}"
    end
    def nombre_apellido
        "#{nombre} #{apellido}"
    end
end
