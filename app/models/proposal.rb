class Proposal < ApplicationRecord
  belongs_to :proposer, class_name: "User", foreign_key: "user_id"
  belongs_to :secondary_category
  delegate :primary_category, to: :secondary_category, allow_nil: true
  has_one :booking, dependent: :destroy
  has_many :slots, dependent: :destroy
  # Pour simple_form #new
  attr_accessor :dates, :start_slot, :end_slot
end
