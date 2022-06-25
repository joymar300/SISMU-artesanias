class Client < ApplicationRecord
    # has_many :productos, through: :pedidos, dependent: :destroy
    has_many :facturas, dependent: :destroy

    def nombre_completo
        "#{id}- #{nombre_cli} #{nombre2_cli}"
    end
    validates :id, :correo_cli, uniqueness: {:message => "Campo único"}
    validates :id, :nombre_cli, :apellido_cli, :tel_cli, :correo_cli, :direccion_cli ,presence: {:message => "Requerido"}
    validates :nombre_cli,:nombre2_cli, :apellido_cli,:apellido2_cli, format: { with: /\A[a-zA-Z]+\z/, message: "solo se permiten letras" }
    validates :id, length: {  in:7.. 10, :message=>"tiene que contener minimo 7 numeros maximo 10" }
    
    def self.search(search)
        if search
          where( ["id LIKE  ? or nombre_cli LIKE ? ", "%#{search}%","%#{search}%"]  )
        else
            unscoped
        end
      end
end
