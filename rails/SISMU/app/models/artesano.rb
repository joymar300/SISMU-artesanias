class Artesano < ApplicationRecord

    validates :nombre,:apellido,:id,presence: {:message => "requeridos"}
    validates :nombre,:apellido,:snombre,:sapellido,format: { with: /\A[a-zA-Z]+\z/, message: "solo se permiten letras" } 
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
