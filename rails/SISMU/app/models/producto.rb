class Producto < ApplicationRecord
    
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :materials
    mount_uploader :avatar, AvatarUploader
end
