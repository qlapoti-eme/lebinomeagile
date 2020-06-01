class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.date :start_time
      t.references :proposal

      t.timestamps
    end
  end
end
