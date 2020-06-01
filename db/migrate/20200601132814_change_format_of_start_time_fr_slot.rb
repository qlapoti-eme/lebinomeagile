class ChangeFormatOfStartTimeFrSlot < ActiveRecord::Migration[6.0]
  def change
    change_column :slots, :start_time, :datetime
  end
end
