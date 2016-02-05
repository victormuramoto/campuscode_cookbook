require 'rails_helper'
  feature 'User creates a recipe' do
    scenario 'success' do
      recipe = build(:recipe)

      visit new_recipe_path

      fill_in 'recipe[name]', with: recipe.name
      fill_in 'recipe[number_people]', with: recipe.number_people
      fill_in 'recipe[time_prepare]', with: recipe.time_prepare
      fill_in 'recipe[ingredients]', with: recipe.ingredients
      fill_in 'recipe[description]', with: recipe.description
      select  recipe.company.name, from:'recipe[recipe[difficult]]'
      select  recipe.company.name, from:'recipe[recipe[food_type_id]]'
      select  recipe.company.name, from:'recipe[recipe[food_preference_id]]'
      select  recipe.company.name, from:'recipe[recipe[kitchen_id]]'

      click_on  'submit'

      expect(page).to have_content recipe.name
      expect(page).to have_content recipe.number_people
      expect(page).to have_content recipe.time_prepare
      expect(page).to have_content recipe.ingredients
      expect(page).to have_content recipe.description
      expect(page).to have_content recipe.difficult
      expect(page).to have_content recipe.food_type.name
      expect(page).to have_content recipe.food_preference.name
      expect(page).to have_content recipe.kitchen.name
    end
  end
