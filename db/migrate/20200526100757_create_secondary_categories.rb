class CreateSecondaryCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :secondary_categories do |t|
      t.string :name
      t.references :primary_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
