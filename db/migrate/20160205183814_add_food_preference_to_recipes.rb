class AddFoodPreferenceToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :food_preference, index: true, foreign_key: true
  end
end
