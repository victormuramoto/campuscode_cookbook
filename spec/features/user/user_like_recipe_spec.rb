require 'rails_helper'
feature 'User like a recipe ' do
  scenario 'user see like button in your own recipes' do
    user = login_user
    recipe1 = create(:recipe, user: user)

    visit recipe_path(recipe1)

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.number_people
    expect(page).to have_content recipe1.time_prepare
    expect(page).to have_content recipe1.ingredients
    expect(page).to have_content recipe1.description
    expect(page).to have_selector("input[type=submit][value= '#{t('recipes.buttons.like_recipe')}']")
  end
  scenario 'user see like button in recipes of other users' do
    login_user
    recipe1 = create(:recipe,
                     user: create(:user, email: 'other@gmail.com',
                                         password: '12345678'))

    visit recipe_path(recipe1)

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.number_people
    expect(page).to have_content recipe1.time_prepare
    expect(page).to have_content recipe1.ingredients
    expect(page).to have_content recipe1.description
    expect(page).to have_selector("input[type=submit][value= '#{t('recipes.buttons.like_recipe')}']")
  end
  scenario 'user can just like one time' do
    user = login_user
    recipe1 = create(:recipe, user: user)

    visit recipe_path(recipe1)
    expect(page).to have_selector "input[type=submit][value= '#{t('recipes.buttons.like_recipe')}']"
    click_button t('recipes.buttons.like_recipe')

    expect(page).to have_selector "input[type=submit][value= '#{t('recipes.buttons.unlike_recipe')}']"
    expect(page).to have_content t('flash.recipes.like.notice')
  end
  scenario 'user can just unlike one time' do
    user = login_user
    recipe1 = create(:recipe, user: user)
    create(:user_recipe, recipe_id: recipe1.id,
                         user_id: user.id)

    visit recipe_path(recipe1)
    expect(page).to have_selector "input[type=submit][value= '#{t('recipes.buttons.unlike_recipe')}']"
    click_button t('recipes.buttons.unlike_recipe')

    expect(page).to have_selector "input[type=submit][value= '#{t('recipes.buttons.like_recipe')}']"
    expect(page).to have_content t('flash.recipes.unlike.notice')
  end
  scenario 'user can just like one time' do
    user = create(:user)
    recipe1 = create(:recipe, user: user)

    visit recipe_path(recipe1)
    expect(page).to_not have_selector "input[type=submit][value= '#{t('recipes.buttons.like_recipe')}']"
  end
  scenario 'user cannot unlike without login' do
    user = create(:user)
    recipe1 = create(:recipe, user: user)
    create(:user_recipe, recipe_id: recipe1.id,
                         user_id: user.id)

    visit recipe_path(recipe1)
    expect(page).to_not have_selector "input[type=submit][value= '#{t('recipes.buttons.unlike_recipe')}']"
  end
end
