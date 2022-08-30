class Empresa < ApplicationRecord
    has_many :emfacturas, dependent: :destroy

    validates :id, :nombre, :direccion, presence: {:message => "«Este campo es obligatorio»"}
    validates :id, uniqueness: {:message => "«Este número de NIT ya se encuentra en uso»"}
    validates :id, numericality: { only_integer: true }

    # nuevas validaciones actualizacion version 1.2
    
    validates :correo, uniqueness: { :message => "«El correo electronico ingresado ya se encuentra en uso»" }
    validates :id, :tel, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 99999999999, :message => "«No se permiten números negativos»"  }
    validates :tel, length: { is: 10, message: "«Introduzca un numero de telefono válido» (El número de telefono solo puede tener 10 digitos)" }


    


    def empresa_busqueda
        "#{id}- #{nombre}"
    end
    def empresa_envio
      "#{direccion}- #{ciudad}- #{barrio}"
    end
    def self.search(search)
        if search
          where( ["id LIKE  ? or nombre LIKE ? ", "%#{search}%","%#{search}%"]  )
        else
            unscoped
        end
      end
end
