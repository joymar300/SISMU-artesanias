class Client < ApplicationRecord
    # has_many :productos, through: :pedidos, dependent: :destroy
    has_many :facturas, dependent: :destroy

    def nombre_completo
        "#{id}- #{nombre_cli} #{nombre2_cli}"
    end
    validates :id, uniqueness: {:message => "Este numero de cedula ya se encuentra en uso"}
    validates :id, :correo_cli, uniqueness: {:message => "El correoingresado ya se encuentran en uso"}
    validates :id, :nombre_cli, :apellido_cli, :tel_cli, :correo_cli, :direccion_cli,:ciudad, :barrio, presence: {:message => "Requerido"}
    validates :nombre_cli, :apellido_cli, format: { with: /\A[a-zA-Z]+\z/, message: "Solo se permiten letras" }
    validates :id, length: {  in:7.. 10, :message=>"Tiene que contener mínimo 7 numeros maximo 10" }
    
    def self.search(search)
        if search
          where( ["id LIKE  ? or nombre_cli LIKE ? ", "%#{search}%","%#{search}%"]  )
        else
            unscoped
        end
      end
end
