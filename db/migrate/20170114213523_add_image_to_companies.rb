class AddImageToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :image, :string
  end
end
