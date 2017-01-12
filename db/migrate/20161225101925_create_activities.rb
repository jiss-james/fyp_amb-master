class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :activity_name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.boolean :vehicle
      t.string :mobile
      t.string :telephone

      t.timestamps
    end
  end
end
