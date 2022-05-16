class Producto < ApplicationRecord
    has_and_belongs_to_many :categories,  dependent: :destroy
    # has_many :clients, through: :pedidos, dependent: :destroy


    has_many :detalles, dependent: :destroy
    has_many :factura, through: :detalles
end
