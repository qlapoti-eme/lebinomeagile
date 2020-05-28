class AddImageToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :primary_categories, :image, :string
  end
end
