class SecondaryCategory < ApplicationRecord


  SUB_CATEGORIES_1 = SecondaryCategory.find_by primary_category_id: "primary_category1"
  # SUB_CATEGORIES_1 = ["primaire", "secondaire", "lycée"]
  SUB_CATEGORIES_2 = ["culinaire", "littéraire", "musical", "linguistique"]
  SUB_CATEGORIES_3 = ["bricolage", "botanique", "coaching personnel"]

  belongs_to :primary_category
  has_many :proposals,  dependent: :destroy
end
