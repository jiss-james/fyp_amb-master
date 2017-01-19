class Conversation < ApplicationRecord
  validates :user_id, :subject, :receiver_id, presence: true
  has_many :user_conversations, dependent: :destroy
  has_many :users, through: :user_conversations
  has_many :messages, dependent: :destroy
  belongs_to :user

  after_create :add_user_to_conversation

  private

  def add_user_to_conversation
    UserConversation.create(user_id: receiver_id, conversation: self)
    UserConversation.create(user: self.user, conversation: self)
  end

end
