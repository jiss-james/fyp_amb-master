class AddPhoneNumbersToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobile, :string
    add_column :users, :telephone, :string
  end
end