class AddLikeToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :likes, :integer, default: 0, null: false
  end
end
