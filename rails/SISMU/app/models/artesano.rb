class Artesano < ApplicationRecord

    validates :nombre,:apellido,:id,presence: {:message => "requeridos"}
    validates :nombre,:apellido, format: { with: /\A[a-zA-Z]+\z/, message: "Solo se permiten letras" } 
    validates :id, uniqueness: {:message => "Este numero de cedula ya se encuentra en uso"},length: {  in:7.. 10, :message=>"Tiene que contener minimo 7 numeros maximo 10" }
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
