class Proposal < ApplicationRecord
  belongs_to :proposer, class_name: "User", foreign_key: "user_id"
  belongs_to :secondary_category
  delegate :primary_category, to: :secondary_category, allow_nil: true
  has_one :booking, dependent: :destroy
  # Pour simple_form #new
  # attr_accessor :primary_category
end
