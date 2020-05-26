class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.string :name
      t.string :description
      t.string :start_time
      t.string :end_time
      t.string :reservation_status
      t.references :user, null: false, foreign_key: true
      t.references :secondary_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
