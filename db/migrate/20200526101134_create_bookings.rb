class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :reservation_status
      t.string :url_room
      t.integer :chatroom
      t.references :user, null: false, foreign_key: true
      t.references :proposal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
