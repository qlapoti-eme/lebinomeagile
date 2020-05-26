class Proposal < ApplicationRecord
  belongs_to :proposer, class_name: "User", foreign_key: "user_id"
  belongs_to :secondary_category
  delegate :primary_category, to: :secondary_category
  has_one :booking, dependent: :destroy
end
