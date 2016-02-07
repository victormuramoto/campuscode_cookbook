require 'rails_helper'
feature 'User creates a recipe' do
  scenario 'success without image' do
    user - login_user
    recipe = build(:recipe,
                   food_preference: create(:food_preference),
                   food_type: create(:food_type),
                   kitchen: create(:kitchen),
                   user:user)

    visit new_recipe_path

    fill_in 'recipe[name]', with: recipe.name
    fill_in 'recipe[number_people]', with: recipe.number_people
    fill_in 'recipe[time_prepare]', with: recipe.time_prepare
    fill_in 'recipe[ingredients]', with: recipe.ingredients
    fill_in 'recipe[description]', with: recipe.description
    select  recipe.difficult, from: 'recipe[difficult]'
    select  recipe.food_type.name, from: 'recipe[food_type_id]'
    select  recipe.food_preference.name, from: 'recipe[food_preference_id]'
    select  recipe.kitchen.name, from: 'recipe[kitchen_id]'

    click_on 'submit'

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
  scenario 'success with image' do
    user = login_user
    recipe = build(:recipe,
                   food_preference: create(:food_preference),
                   food_type: create(:food_type),
                   kitchen: create(:kitchen),
                   user:user)

    visit new_recipe_path

    fill_in 'recipe[name]', with: recipe.name
    fill_in 'recipe[number_people]', with: recipe.number_people
    fill_in 'recipe[time_prepare]', with: recipe.time_prepare
    fill_in 'recipe[ingredients]', with: recipe.ingredients
    fill_in 'recipe[description]', with: recipe.description
    select  recipe.difficult, from: 'recipe[difficult]'
    select  recipe.food_type.name, from: 'recipe[food_type_id]'
    select  recipe.food_preference.name, from: 'recipe[food_preference_id]'
    select  recipe.kitchen.name, from: 'recipe[kitchen_id]'
    page.attach_file('recipe[image]', Rails.root +
                     'app/assets/images/strogonoff.jpg')

    click_on 'submit'

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.number_people
    expect(page).to have_content recipe.time_prepare
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.description
    expect(page).to have_content recipe.difficult
    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.food_preference.name
    expect(page).to have_content recipe.kitchen.name
    expect(page).to have_css("img[src*='image.jpg']")
  end
  scenario 'invalid data' do
    user = login_user
    recipe = build(:recipe,
                   food_preference: create(:food_preference),
                   food_type: create(:food_type),
                   kitchen: create(:kitchen),
                   user:user)

    visit new_recipe_path

    fill_in 'recipe[number_people]', with: recipe.number_people
    within '#recipe_food_type_id' do
      find("option[value='']").click
    end
    within '#recipe_food_preference_id' do
      find("option[value='']").click
    end
    within '#recipe_kitchen_id' do
      find("option[value='']").click
    end
    fill_in 'recipe[time_prepare]', with: recipe.time_prepare
    select  recipe.difficult, from: 'recipe[difficult]'

    click_on 'submit'

    expect(page).to have_content t('flash.recipes.create.alert')
  end
  scenario 'Redirected to sign in page' do
    visit new_recipe_path

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end

end
