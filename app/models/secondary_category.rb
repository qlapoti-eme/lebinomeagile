class SecondaryCategory < ApplicationRecord
  belongs_to :primary_category
  has_many :proposals
end
