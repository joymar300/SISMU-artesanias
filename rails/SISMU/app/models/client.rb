class Client < ApplicationRecord
    # has_many :productos, through: :pedidos, dependent: :destroy
    has_many :facturas, dependent: :destroy

    def nombre_completo
        "#{id}- #{nombre_cli} #{nombre2_cli}"
    end
    validates :id, uniqueness: {:message => "Este numero de cedula ya se encuentra en uso"}
    validates :id, :correo_cli, uniqueness: {:message => "El correo ingresado ya se encuentra en uso"}
    validates :id, :nombre_cli, :apellido_cli, :tel_cli, :correo_cli, :direccion_cli,:ciudad, :barrio, presence: {:message => "Requerido"}
    validates :nombre_cli, :apellido_cli, :nombre2_cli, :ciudad, :apellido2_cli,  format: { with: /\A[a-zA-Z]+\z/, :message => "Solo se permiten letras" }
    validates :id, length: {  in:7.. 10, :message=>"Tiene que contener mínimo 7 digitos y maximo 10" }

    # nuevas validaciones actualizacion version 1.2
    
    validates :tel_cli, length: { is: 10, message: "Solo pueden tener 10 digitos" }
    validates :id, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 99999999999, :message => "No se aceptan numeros negativos"  }

    validates :correo_cli, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :message => "Debe ser una direccion de correo electronico"}






    
    def self.search(search)
        if search
          where( ["id LIKE  ? or nombre_cli LIKE ? ", "%#{search}%","%#{search}%"]  )
        else
            unscoped
        end
      end
end
