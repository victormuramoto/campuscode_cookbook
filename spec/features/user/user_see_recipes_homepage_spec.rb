require 'rails_helper'
feature 'User sse recipes in homepage' do
  scenario 'success' do
    recipe1 = create(:recipe)
    recipe2 = create(:recipe)

    visit root_path

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.difficult
    expect(page).to have_content recipe1.food_type.name
    expect(page).to have_content recipe1.food_preference.name
    expect(page).to have_content recipe1.kitchen.name

    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe2.difficult
    expect(page).to have_content recipe2.food_type.name
    expect(page).to have_content recipe2.food_preference.name
    expect(page).to have_content recipe2.kitchen.name
  end

  scenario 'success with image' do
    recipe1 = create(:recipe, image: File.new(
                                              Rails.root + 'app/assets/images/strogonoff.jpg'))
    recipe2 = create(:recipe,
                     image: File.new(
                                     Rails.root + 'app/assets/images/strogonoff.jpg'))
    visit root_path

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.difficult
    expect(page).to have_content recipe1.food_type.name
    expect(page).to have_content recipe1.food_preference.name
    expect(page).to have_content recipe1.kitchen.name
    expect(page).to have_css("img[src*='image.jpg']")

    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe2.difficult
    expect(page).to have_content recipe2.food_type.name
    expect(page).to have_content recipe2.food_preference.name
    expect(page).to have_content recipe2.kitchen.name
    expect(page).to have_css("img[src*='image.jpg']")
  end

end
