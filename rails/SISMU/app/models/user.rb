class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_one_attached :avatar

         def avatar_thumbnail
           if avatar.attached?
            # avatar.variant(resize: "150x150").processed
            avatar.variant(resize_to_fill: [150, nil])
           else
             '/default_profile.jpg'
           end
         end
has_one :profile, dependent: :destroy

after_create :set_profile

def set_profile
  self.profile = Profile.create()
end
end
