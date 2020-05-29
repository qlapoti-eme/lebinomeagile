class Booking < ApplicationRecord
  belongs_to :booker, class_name: "User", foreign_key: "user_id"
  belongs_to :proposal
  delegate :proposer, to: :proposal
  before_create :set_zoom_url

  def set_zoom_url
    url_room = "zoom.com"
  end

end
