class Producto < ApplicationRecord
    
    has_and_belongs_to_many :categories
    mount_uploader :avatar, AvatarUploader
end
