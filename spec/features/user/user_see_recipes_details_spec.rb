require 'rails_helper'
feature 'User see recipes details' do
  scenario 'success' do
    recipe1 = create(:recipe)

    visit recipe_path(recipe1)

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.number_people
    expect(page).to have_content recipe1.time_prepare
    expect(page).to have_content recipe1.ingredients
    expect(page).to have_content recipe1.description
  end

  scenario 'success with image' do
    recipe1 = create(:recipe, image: File.new(
                                              Rails.root + 'app/assets/images/strogonoff.jpg'))
    visit recipe_path(recipe1)

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.number_people
    expect(page).to have_content recipe1.time_prepare
    expect(page).to have_content recipe1.ingredients
    expect(page).to have_content recipe1.description
    expect(page).to have_css("img[src*='image.jpg']")

  end
end
