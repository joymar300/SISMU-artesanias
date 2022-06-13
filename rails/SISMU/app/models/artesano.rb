class Artesano < ApplicationRecord
    validates :nombre, presence: true
    validates :nombre,:snombre,:nombre2_cli,:sapellido,:cedula, :tel ,presence: {:message => "requeridos"}
    validates :id, uniqueness: {:message => "esa cedula está en uso"}
    has_many :dproductions, dependent: :destroy
    has_many :production, through: :dproductions
   
    def nombre_completo
        "#{cedula}- #{nombre} #{apellido}"
    end
    def nombre_apellido
        "#{nombre} #{apellido}"
    end
   

end
