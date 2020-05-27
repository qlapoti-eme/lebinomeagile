class PrimaryCategory < ApplicationRecord
  CATEGORIES = ["Soutient scolaire", "Moment loisir", "Conseils"]
  has_many :secondary_categories, dependent: :destroy
  has_many :proposals, through: :secondary_categories, dependent: :destroy
end
