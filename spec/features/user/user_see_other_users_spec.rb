require 'rails_helper'
feature 'User see other users profile' do
  scenario 'success without login' do
    recipe = create(:recipe)

    visit recipe_path(recipe)

    click_on recipe.user.first_name

    expect(page).to have_content recipe.user.first_name
    expect(page).to have_content recipe.user.last_name
    expect(page).to have_content recipe.user.email
    expect(page).to have_content recipe.user.city
    expect(page).to have_content recipe.user.facebook
    expect(page).to have_content recipe.user.twitter
  end
  scenario 'success with login' do
    user = login_user
    recipe = create(:recipe, user: create(:user,
                                          first_name: 'Joao',
                                          last_name: 'Das Neves',
                                          password: 'eunaoseinada',
                                          password_confirmation: 'eunaoseinada',
                                          email: 'nada@eusei.com.br'))

    visit recipe_path(recipe)

    click_on recipe.user.first_name

    expect(page).to have_content recipe.user.first_name
    expect(page).to have_content recipe.user.last_name
    expect(page).to have_content recipe.user.email
    expect(page).to have_content recipe.user.city
    expect(page).to have_content recipe.user.facebook
    expect(page).to have_content recipe.user.twitter
  end
  scenario 'show kitchens' do
    user = login_user
    kitchen1 = create(:kitchen, name: 'Paulista')
    kitchen2 = create(:kitchen, name: 'Gaucha')
    kitchen3 = create(:kitchen, name: 'Nordestina')
    recipe = create(:recipe, user: create(:user,
                                          first_name: 'Joao',
                                          last_name: 'Das Neves',
                                          password: 'eunaoseinada',
                                          password_confirmation: 'eunaoseinada',
                                          email: 'nada@eusei.com.br'))

    create(:kitchens_user, kitchen_id: kitchen1.id,
                           user_id: recipe.user.id)
    create(:kitchens_user, kitchen_id: kitchen2.id,
                           user_id: recipe.user.id)
    create(:kitchens_user, kitchen_id: kitchen3.id,
                           user_id: recipe.user.id)

    visit recipe_path(recipe)

    click_on recipe.user.first_name

    expect(page).to have_content recipe.user.first_name
    expect(page).to have_content recipe.user.last_name
    expect(page).to have_content recipe.user.email
    expect(page).to have_content recipe.user.city
    expect(page).to have_content recipe.user.facebook
    expect(page).to have_content recipe.user.twitter
    expect(page).to have_content kitchen1.name
    expect(page).to have_content kitchen2.name
    expect(page).to have_content kitchen3.name
  end
  scenario 'show all recipes' do
    user = login_user
    recipe = create(:recipe, user: create(:user,
                                          first_name: 'Joao',
                                          last_name: 'Das Neves',
                                          password: 'eunaoseinada',
                                          password_confirmation: 'eunaoseinada',
                                          email: 'nada@eusei.com.br'))

    visit recipe_path(recipe)

    click_on recipe.user.first_name

    expect(page).to have_content recipe.user.first_name
    expect(page).to have_content recipe.user.last_name
    expect(page).to have_content recipe.user.email
    expect(page).to have_content recipe.user.city
    expect(page).to have_content recipe.user.facebook
    expect(page).to have_content recipe.user.twitter

    user_owner = recipe.user

    user_owner.recipes.each do |recipe|
      expect(page).to have_content recipe.name
      expect(page).to have_content recipe.ingredients
      expect(page).to have_content recipe.description
    end
  end
end
