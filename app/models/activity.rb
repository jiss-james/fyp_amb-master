class Activity < ApplicationRecord

  	belongs_to :company

    geocoded_by :location
    after_validation :geocode

    after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

end
