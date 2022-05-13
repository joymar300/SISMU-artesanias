class Client < ApplicationRecord
    has_many :productos, through: :pedidos, dependent: :destroy
end
