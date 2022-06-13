class Client < ApplicationRecord
    # has_many :productos, through: :pedidos, dependent: :destroy
    has_many :facturas, dependent: :destroy

    def nombre_completo
        "#{id}- #{nombre_cli} #{nombre2_cli}"
    end
    validates :cedula_cli, :correo_cli, uniqueness: {:message => "campos unico"}
    validates :cedula_cli, :nombre_cli, :nombre2_cli,:apellido_cli,:apellido2_cli,
     :tel_cli, :correo_cli, :direccion_cli ,presence: {:message => "requeridos"}
     validates :id, uniqueness: {:message => "esa cedula está en uso"}
end
