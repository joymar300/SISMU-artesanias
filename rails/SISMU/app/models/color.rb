class Color < ApplicationRecord
    has_and_belongs_to_many :detalles
    has_and_belongs_to_many :emdetalles


    validates :tipo, presence: {:message => "«Este campo es obligatorio»"}
    validates :tipo, uniqueness: {:message => "«Este nombre de color ya se encuentra en uso»"}
    validates :tipo, format: { with: /\A[a-zA-ZÀ-ÿ\s]+$\z/, :message => "«Se permiten solo letras» (no se permiten carácteres especiales o espacios)" }
end
