class Activity < ApplicationRecord

  	belongs_to :company

    geocoded_by :location
    after_validation :geocode

    after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

    mount_uploader :image, ImageUploader

    validates :activity_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only allows letters" }
    validates :description, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :location, presence: true
    validates :mobile, numericality: { only_integer: true}, :allow_blank => true
    validates :telephone, numericality: { only_integer: true}, :allow_blank => true

end
