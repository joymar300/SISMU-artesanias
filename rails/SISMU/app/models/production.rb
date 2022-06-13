class Production < ApplicationRecord
  has_many :dproductions, dependent: :destroy
  validates :ref, uniqueness: {:message => "ese nombre de referencia ya se encuentra en uso"}
end
