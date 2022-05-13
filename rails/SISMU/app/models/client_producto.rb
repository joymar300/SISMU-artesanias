class ClientProducto < ApplicationRecord
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :productos
  accepts_nested_attributes_for :clients
  accepts_nested_attributes_for :productos
end
