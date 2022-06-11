class Producto < ApplicationRecord
    has_and_belongs_to_many :categories,  dependent: :destroy
    # has_many :clients, through: :pedidos, dependent: :destroy

    has_many :dproductions, dependent: :destroy
    has_many :detalles, dependent: :destroy
    has_many :factura, through: :detalles
    has_many :production, through: :productions
    has_many :emdetalles, dependent: :destroy
    has_many :emfactura, through: :emdetalles
    validates :referencia_pro, :nombre_pro, :precio_pro ,presence: {:message => "requeridos"}
    validates :referencia_pro, uniqueness: {:message => "referencia unica"}
    validates :referencia_pro, :precio_pro ,numericality: {:message => "numericos"
    }

end
