class Production < ApplicationRecord
  has_many :dproductions, dependent: :destroy
  validates :ref, presence: {:message => "Requerido"}
  validates :ref, uniqueness: {:message => "Referencia Utilizada"}

end
