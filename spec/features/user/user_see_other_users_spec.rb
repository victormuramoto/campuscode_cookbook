require 'rails_helper'
feature 'User see other users profile' do
  scenario 'success without login' do
    recipe = create(:recipe)

    visit recipe_path(recipe)

    click_on recipe.user.first_name

    expect(page).to have_content recipe1.user.first_name
    expect(page).to have_content recipe1.user.last_name
    expect(page).to have_content recipe1.user.email
    expect(page).to have_content recipe1.user.city
    expect(page).to have_content recipe1.user.facebook
    expect(page).to have_content recipe1.user.twitter
  end
  scenario 'success with login' do
    user = login_user
    recipe = create(:recipe, user: create(:user,
                                          first_name:'Joao',
                                          last_name: 'Das Neves',
                                          password:'eunaoseinada',
                                          password_confirmation:'eunaoseinada',
                                          email:'nada@eusei.com.br'))

    visit recipe_path(recipe)

    click_on recipe.user.first_name

    expect(page).to have_content recipe1.user.first_name
    expect(page).to have_content recipe1.user.last_name
    expect(page).to have_content recipe1.user.email
    expect(page).to have_content recipe1.user.city
    expect(page).to have_content recipe1.user.facebook
    expect(page).to have_content recipe1.user.twitter
  end
end
