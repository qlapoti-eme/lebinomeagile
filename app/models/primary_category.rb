class PrimaryCategory < ApplicationRecord
  has_many :secondary_categories
  has_many :proposals, through: :secondary_categories
end
