class Artesano < ApplicationRecord

    validates :nombre,:apellido,:id,presence: {:message => "requeridos"}
    validates :nombre,:apellido,:snombre,:sapellido,format: { with: /\A[a-zA-Z]+\z/, message: "solo se permiten letras" } 
    validates :id, uniqueness: {:message => "esa cedula está en uso"},length: {  in:7.. 10, :message=>"tiene que contener minimo 7 numeros maximo 10" }
    has_many :dproductions, dependent: :destroy
    has_many :production, through: :dproductions
   
    def nombre_completo
        "#{id}- #{nombre} #{apellido}"
    end
    def nombre_apellido
        "#{nombre} #{apellido}"
    end
    def self.search(search)
        if search
          where( ["id LIKE  ? or nombre LIKE ? ", "%#{search}%","%#{search}%"]  )
        else
            unscoped
        end
      end

end
