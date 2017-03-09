class Activity < ApplicationRecord

    #relationship
  	belongs_to :company

    #converting address to lat and long
    geocoded_by :location
    after_validation :geocode
    after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

    #takes care of image upload
    mount_uploader :image, ImageUploader

    #attribute vaildations
    validates :activity_name, presence: true
    validates :description, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :location, presence: true
    validates :mobile, numericality: { only_integer: true}, :allow_blank => true
    validates :telephone, numericality: { only_integer: true}, :allow_blank => true

end
