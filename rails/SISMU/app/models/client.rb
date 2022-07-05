class Client < ApplicationRecord
    # has_many :productos, through: :pedidos, dependent: :destroy
    has_many :facturas, dependent: :destroy

    def nombre_completo
        "#{id}- #{nombre_cli} #{nombre2_cli}"
    end
    def cli_envio
      "#{direccion_cli}- #{ciudad}- #{barrio}"
    end
    validates :id, uniqueness: {  :message => "«Este número de identificación  ya se encuentra en uso»" }
    validates :id, :correo_cli, uniqueness: { :message => "«El correo electronico ingresado ya se encuentra en uso»" }
    validates :id, :nombre_cli, :apellido_cli, :tel_cli, :correo_cli, :direccion_cli,:ciudad, presence: { :message => "«Este campo es obligatorio»"  }
    validates :nombre_cli, :apellido_cli, :ciudad, format: { with: /\A[a-zA-ZÀ-ÿ]+\z/, :message => "«Se permiten solo letras» (no se permiten carácteres especiales o espacios)" }
    validates :id, length: {  in:7.. 10, :message=>"«Debe contener entre 7 y 10 digitos numéricos»" }

    # nuevas validaciones actualizacion version 1.2
    
    validates :tel_cli, length: { is: 10, message: "«Introduzca un numero de telefono válido» (El número de telefono solo puede tener 10 digitos)" }
    validates :id, :tel_cli, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 99999999999, :message => "«No se permiten números negativos»"  }
    validates :correo_cli, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :message => "«Introduzca una dirección de correo electrónico válida»"  }
    validates :barrio,  format: { with: /\A[A-Za-z\s]+$\z/, :message => "«Se permiten solo letras» (no se permiten carácteres especiales)" }

    
    def self.search(search)
        if search
          where( ["id LIKE  ? or nombre_cli LIKE ? ", "%#{search}%","%#{search}%"]  )
        else
            unscoped
        end
      end
end
