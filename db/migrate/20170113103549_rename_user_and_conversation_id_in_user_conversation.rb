class RenameUserAndConversationIdInUserConversation < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_conversations, :users_id, :user_id
    rename_column :user_conversations, :conversations_id, :conversation_id
  end
end
