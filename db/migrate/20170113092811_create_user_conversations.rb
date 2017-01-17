class CreateUserConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_conversations do |t|
      t.references :users
      t.references :conversations
      t.timestamps
    end
  end
end
