require 'rails_helper'
feature 'User like a recipe ' do
  scenario 'user see favorite button in your own recipes' do
    recipe1 = create(:recipe)

    visit recipe_path(recipe1)

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.number_people
    expect(page).to have_content recipe1.time_prepare
    expect(page).to have_content recipe1.ingredients
    expect(page).to have_content recipe1.description
    expect(page).to have_content recipe1.description
    expect(page).to have_selector("input[type=submit][value= '#{t('recipes.buttons.like_recipe')}']")
  end

end
