class PrimaryCategory < ApplicationRecord
  has_many :secondary_categories, dependent: :destroy
  has_many :proposals, through: :secondary_categories, dependent: :destroy
end
