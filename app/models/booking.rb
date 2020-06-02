class Booking < ApplicationRecord
  belongs_to :booker, class_name: "User", foreign_key: "user_id"
  belongs_to :proposal
  delegate :proposer, to: :proposal
  before_create :set_room_name

  # callback ActiveRecord 
  def set_room_name
    client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
    room = client.video.rooms.create(unique_name: "#{proposal.name}_#{Time.now.to_i}")
    self.url_room = room.unique_name
  end
end
