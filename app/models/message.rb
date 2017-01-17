class Message < ApplicationRecord


  validates :message, :conversation_id, :user_id, presence: true

  belongs_to :conversation
  belongs_to :user

end
