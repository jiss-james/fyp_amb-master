class AddReceiverIdToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :receiver_id, :integer
  end
end
