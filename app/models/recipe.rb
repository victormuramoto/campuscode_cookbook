class Recipe < ActiveRecord::Base
  attachment :image
  belongs_to :food_type
  belongs_to :food_preference
  belongs_to :kitchen
end
