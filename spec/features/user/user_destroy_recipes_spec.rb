require 'rails_helper'
feature 'User destroy a recipe' do
  scenario 'find button to destroy recipe' do
    user = login_user
    recipe = create(:recipe, user:user)

    visit recipe_path(recipe)

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.number_people
    expect(page).to have_content recipe.time_prepare
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.description
    expect(page).to have_content recipe.difficult
    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.food_preference.name
    expect(page).to have_content recipe.kitchen.name
    expect(page).to have_selector("input[type=submit][value= '#{t('recipes.buttons.destroy_recipe')}']")
  end
  scenario 'success' do
    user = login_user
    recipe = create(:recipe, user:user)

    visit recipe_path(recipe)

    expect { click_button t('recipes.buttons.destroy_recipe') }.to change(Recipe, :count).by(-1)

    expect(page).to have_content t('flash.recipes.destroy.notice')
  end
  scenario 'user cannot destroy recipes of other users' do
    user = login_user
    recipe = create(:recipe,
                     user:create(:user, email:'other@user.com.br'))

    visit recipe_path(recipe)

    expect(page).to_not have_selector("input[type=submit][value= '#{t('recipes.buttons.destroy_recipe')}']")
  end
end
