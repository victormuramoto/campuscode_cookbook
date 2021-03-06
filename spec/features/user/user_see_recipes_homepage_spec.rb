require 'rails_helper'
feature 'User see recipes in homepage' do
  scenario 'success' do
    user = create(:user)
    recipe1 = create(:recipe, user: user)
    recipe2 = create(:recipe, user: user)

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
    user = create(:user)
    recipe1 = create(:recipe,
                     image: File.new(
                       Rails.root + 'app/assets/images/strogonoff.jpg'),
                     user: user)
    recipe2 = create(:recipe,
                     image: File.new(
                       Rails.root + 'app/assets/images/strogonoff.jpg'),
                     user: user)
    visit root_path

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.difficult
    expect(page).to have_content recipe1.food_type.name
    expect(page).to have_content recipe1.food_preference.name
    expect(page).to have_content recipe1.kitchen.name
    expect(page).to have_css("img[src*='image']")

    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe2.difficult
    expect(page).to have_content recipe2.food_type.name
    expect(page).to have_content recipe2.food_preference.name
    expect(page).to have_content recipe2.kitchen.name
    expect(page).to have_css("img[src*='image']")
  end

  scenario 'see last 19 recipes created' do
    user = create(:user)
    recipes = create_list(:recipe, 19, user: user)

    visit root_path

    recipes.each do |recipe|
      expect(page).to have_content recipe.name
    end
  end
  scenario 'see last 20 recipes created' do
    user = create(:user)
    recipes = create_list(:recipe, 20, user: user)

    visit root_path

    recipes.each do |recipe|
      expect(page).to have_content recipe.name
    end
  end
  scenario 'do not see last 21 recipes created' do
    user = create(:user)
    recipes = create_list(:recipe, 21, user: user)
    visit root_path
    (20..1).each do |i|
      expect(page).to have_content recipes[i].name
    end
    expect(page).to_not have_content recipes[0].name
  end
end
