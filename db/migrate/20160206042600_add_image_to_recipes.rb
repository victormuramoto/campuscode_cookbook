class AddImageToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :image_id, :string
  end
end
