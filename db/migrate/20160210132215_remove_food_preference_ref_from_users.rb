class RemoveFoodPreferenceRefFromUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :food_preference, index: true, foreign_key: true
  end
end
