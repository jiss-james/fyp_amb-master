class Company < ApplicationRecord

  has_many :activities, dependent: :destroy
	belongs_to :user

  geocoded_by :location
  after_validation :geocode

  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

  mount_uploader :image, ImageUploader

  validates :company_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only allows letters" }
  validates :description, presence: true
  validates :location, presence: true

end
