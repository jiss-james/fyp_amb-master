class AddImageToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :image, :string
  end
end
