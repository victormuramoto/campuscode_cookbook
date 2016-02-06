require 'rails_helper'
feature 'User sse recipes in homepage' do
  scenario 'success' do
    recipe1 = create(:recipe)
    recipe2 = create(:recipe)

    visit root_path

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.number_people
    expect(page).to have_content recipe1.time_prepare
    expect(page).to have_content recipe1.ingredients
    expect(page).to have_content recipe1.description
    expect(page).to have_content recipe1.difficult
    expect(page).to have_content recipe1.food_type.name
    expect(page).to have_content recipe1.food_preference.name
    expect(page).to have_content recipe1.kitchen.name

    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe2.number_people
    expect(page).to have_content recipe2.time_prepare
    expect(page).to have_content recipe2.ingredients
    expect(page).to have_content recipe2.description
    expect(page).to have_content recipe2.difficult
    expect(page).to have_content recipe2.food_type.name
    expect(page).to have_content recipe2.food_preference.name
    expect(page).to have_content recipe2.kitchen.name
  end
end
