class Artesano < ApplicationRecord

    validates :nombre, :apellido, :id, :tel, presence: {:message => "«Este campo es obligatorio»"}
    validates :nombre,:apellido, :snombre, :sapellido, format: { with: /\A[a-zA-ZÀ-ÿ]+\z/, :message => "«Se permiten solo letras» (no se permiten carácteres especiales o espacios)" }
    validates :id, uniqueness: {:message => "«Este número de identificación  ya se encuentra en uso»"},length: {  in:7.. 10, :message=>"«Debe contener entre 7 y 10 digitos numéricos»" }
    
    # nuevas validaciones actualizacion version 1.2

    validates :tel, length: { is: 10, :message => "«Introduzca un numero de telefono válido» (El número de telefono solo puede tener 10 digitos)" } 
    validates :id, :tel, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 99999999999, :message => "«No se permiten números negativos»"  }
    
    
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
