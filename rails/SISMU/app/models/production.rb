class Production < ApplicationRecord
  has_many :dproductions, dependent: :destroy
end
