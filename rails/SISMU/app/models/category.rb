class Category < ApplicationRecord
    has_and_belongs_to_many :productos, dependent: :destroy

    validates :tipo_categoria, presence: {:message => "«Este campo es obligatorio»"}
    validates :tipo_categoria, uniqueness: {:message => "«Este nombre de categoria ya se encuentra en uso»"}
    validates :tipo_categoria, format: { with: /\A[a-zA-ZÀ-ÿ\s]+$\z/, :message => "«Se permiten solo letras» (no se permiten carácteres especiales o espacios)" }
end



