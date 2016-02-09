class CreateUserRecipes < ActiveRecord::Migration
  def change
    create_table :user_recipes do |t|
      t.integer :recipe_id, null:false
      t.integer :user_id, null:false

      t.timestamps null: false
    end
  end
end
