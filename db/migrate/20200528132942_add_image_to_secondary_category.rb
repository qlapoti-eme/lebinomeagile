class AddImageToSecondaryCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :secondary_categories, :image, :string
  end
end
