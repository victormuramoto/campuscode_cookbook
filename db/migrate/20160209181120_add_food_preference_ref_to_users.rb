class AddFoodPreferenceRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :food_preference, index: true, foreign_key: true
  end
end
