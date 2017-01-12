class Company < ApplicationRecord

  has_many :activities, dependent: :destroy
	belongs_to :user
end
