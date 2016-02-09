require 'rails_helper'
feature 'User edits a recipe' do
  scenario 'success' do
    user = login_user
    new_food_preference = create(:food_preference, name: 'Feijão')
    new_food_type = create(:food_type, name: 'Principal')
    new_kitchen = create(:kitchen, name: 'Carioca')

    recipe = create(:recipe, user: user)
    new_recipe = build(:recipe,
                       name: 'Tutu de feijão',
                       number_people: 4,
                       time_prepare: 30,
                       difficult: 'Medio',
                       ingredients: 'Feijão e farinha',
                       description: 'misture tudo',
                       food_preference: new_food_preference,
                       food_type: new_food_type,
                       kitchen: new_kitchen,
                       user: nil)

    visit edit_recipe_path(recipe)

    fill_in 'recipe[name]', with: new_recipe.name
    fill_in 'recipe[number_people]', with: new_recipe.number_people
    fill_in 'recipe[time_prepare]', with: new_recipe.time_prepare
    fill_in 'recipe[ingredients]', with: new_recipe.ingredients
    fill_in 'recipe[description]', with: new_recipe.description
    select  new_recipe.difficult, from: 'recipe[difficult]'
    select  new_recipe.food_type.name, from: 'recipe[food_type_id]'
    select  new_recipe.food_preference.name, from: 'recipe[food_preference_id]'
    select  new_recipe.kitchen.name, from: 'recipe[kitchen_id]'

    click_on 'submit'

    expect(page).to have_content new_recipe.name
    expect(page).to have_content new_recipe.number_people
    expect(page).to have_content new_recipe.time_prepare
    expect(page).to have_content new_recipe.ingredients
    expect(page).to have_content new_recipe.description
    expect(page).to have_content new_recipe.difficult
    expect(page).to have_content new_recipe.food_type.name
    expect(page).to have_content new_recipe.food_preference.name
    expect(page).to have_content new_recipe.kitchen.name

    expect(page).to_not have_content recipe.name
    expect(page).to_not have_content recipe.number_people
    expect(page).to_not have_content recipe.time_prepare
    expect(page).to_not have_content recipe.ingredients
    expect(page).to_not have_content recipe.description
    expect(page).to_not have_content recipe.difficult
    expect(page).to_not have_content recipe.food_type.name
    expect(page).to_not have_content recipe.food_preference.name
    expect(page).to_not have_content recipe.kitchen.name
  end
  scenario 'Redirected to sign in page' do
    recipe = create(:recipe)
    visit edit_recipe_path(recipe)

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end
  scenario 'invalid data' do
    user = login_user
    recipe = create(:recipe,
                    food_preference: create(:food_preference),
                    food_type: create(:food_type),
                    kitchen: create(:kitchen),
                    user: user)

    visit edit_recipe_path(recipe)

    fill_in 'recipe[name]', with: ''
    fill_in 'recipe[number_people]', with: ''
    fill_in 'recipe[time_prepare]', with: ''
    fill_in 'recipe[ingredients]', with: ''
    fill_in 'recipe[description]', with: ''
    fill_in 'recipe[number_people]', with: ''
    within '#recipe_food_type_id' do
      find("option[value='']").click
    end
    within '#recipe_food_preference_id' do
      find("option[value='']").click
    end
    within '#recipe_kitchen_id' do
      find("option[value='']").click
    end
    within '#recipe_difficult' do
      find("option[value='']").click
    end

    click_on 'submit'

    expect(page).to have_content t('flash.recipes.update.alert')
  end
  scenario 'user cannot edit recipes of other users' do
    login_user
    recipe = create(:recipe,
                    user: create(:user, email: 'other@user.com.br'))

    visit edit_recipe_path(recipe)

    expect(page).to have_content t('recipes.permit.not_allowed')
  end
end
