class AddDefaultValueToBookings < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :reservation_status, :string, :default => "pending"
    change_column :bookings, :url_room, :string, :default => "www.zoom.com"
  end
end
