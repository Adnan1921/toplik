class Reservation < ApplicationRecord
    
    validates :start_date, :end_date, :overlap => {:scope => "room_id"}

    belongs_to :room


end
