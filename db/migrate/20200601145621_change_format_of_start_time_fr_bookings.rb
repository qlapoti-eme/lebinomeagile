class ChangeFormatOfStartTimeFrBookings < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :start_time, :datetime
  end
end
