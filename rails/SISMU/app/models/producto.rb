class Producto < ApplicationRecord
    has_and_belongs_to_many :categories,  dependent: :destroy
end
