class Producto < ApplicationRecord
    has_and_belongs_to_many :categories,  dependent: :destroy
    # has_many :clients, through: :pedidos, dependent: :destroy

    has_many :dproductions, dependent: :destroy
    has_many :detalles, dependent: :destroy
    has_many :factura, through: :detalles
    has_many :production, through: :productions
    has_many :emdetalles, dependent: :destroy
    has_many :emfactura, through: :emdetalles

end
