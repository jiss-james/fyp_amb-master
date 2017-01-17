class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :first_name, :last_name, presence: true

  enum gender: [ :male, :female ]

  has_many :companies, dependent: :destroy
  has_many :user_conversations, dependent: :destroy
  has_many :conversations, through: :user_conversations

  geocoded_by :current_location
  after_validation :geocode

  after_validation :geocode, if: ->(obj){ obj.current_location.present? and obj.current_location_changed? }

  mount_uploader :image, ImageUploader
end
