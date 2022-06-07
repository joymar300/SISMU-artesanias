class Color < ApplicationRecord
    has_and_belongs_to_many :detalles
    has_and_belongs_to_many :emdetalles
end
