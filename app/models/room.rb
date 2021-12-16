class Room < ApplicationRecord

    has_many :reservations, dependent: :destroy

    has_one_attached :thumbnail_image

end
