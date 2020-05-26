class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :secondary_category
end
