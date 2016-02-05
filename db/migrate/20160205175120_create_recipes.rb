class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :number_people
      t.integer :time_prepare
      t.string :difficult
      t.text :ingredients
      t.text :description

      t.timestamps null: false
    end
  end
end
