class Recipe < ActiveRecord::Base
  attachment :image
  belongs_to :user
  belongs_to :food_type
  belongs_to :food_preference
  belongs_to :kitchen

  validates :name, :kitchen, :food_type,
            :food_preference, :ingredients, :description, presence: true

  def check_like?(user)
    UserRecipe.where("recipe_id = #{id} and user_id = #{user.id}") == []
  end
end
