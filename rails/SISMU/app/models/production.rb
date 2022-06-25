class Production < ApplicationRecord
  has_many :dproductions, dependent: :destroy

  def self.search(search)
    if search
      where( ["id LIKE  ?", "%#{search}%"]  )
    else
        unscoped
    end
  end
end
