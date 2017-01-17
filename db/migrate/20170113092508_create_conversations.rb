class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.references :user_id, references: :users
      t.string :subject
      t.timestamps
    end
  end
end
