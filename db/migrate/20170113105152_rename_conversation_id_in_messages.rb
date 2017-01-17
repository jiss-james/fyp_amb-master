class RenameConversationIdInMessages < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :conversations_id, :conversation_id
  end
end
