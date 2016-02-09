require 'rails_helper'
feature 'User see liked recipes ' do
  scenario 'user see liked recipes link button' do
    login_user

    visit root_path
    expect(page).to have_content(t('users.menu.links.liked_recipes'))
  end
  scenario 'user cannot see liked recipes link button without login' do
    visit root_path

    expect(page).to_not have_content(t('users.menu.links.liked_recipes'))
  end
  scenario 'user can see recipes he/she liked' do
    user = login_user
    other_user = create(:user, email: 'other@gmail.com', password: '12345678')
    recipe1 = create(:recipe,
                     name: 'Strogonoff frango',
                     user: other_user)
    recipe2 = create(:recipe,
                     name: 'Bile a role',
                     user: other_user)
    recipe3 = create(:recipe,
                     name: 'Pernil Assado',
                     user: other_user)
    recipe4 = create(:recipe,
                     name: 'Peixe Espada',
                     user: other_user)

    create(:user_recipe, recipe_id: recipe1.id,
                         user_id: user.id)
    create(:user_recipe, recipe_id: recipe2.id,
                         user_id: user.id)
    create(:user_recipe, recipe_id: recipe3.id,
                         user_id: user.id)
    create(:user_recipe, recipe_id: recipe4.id,
                         user_id: user.id)

    visit favorite_recipes_path

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe3.name
    expect(page).to have_content recipe4.name
  end
  scenario 'user cannot see recipes other users liked' do
    user = login_user
    other_user = create(:user, email: 'other@gmail.com', password: '12345678')
    recipe1 = create(:recipe,
                     name: 'Strogonoff frango',
                     user: other_user)
    recipe2 = create(:recipe,
                     name: 'Bile a role',
                     user: other_user)
    recipe3 = create(:recipe,
                     name: 'Pernil Assado',
                     user: other_user)
    recipe4 = create(:recipe,
                     name: 'Peixe Espada',
                     user: other_user)

    create(:user_recipe, recipe_id: recipe1.id,
                         user_id: user.id)
    create(:user_recipe, recipe_id: recipe2.id,
                         user_id: user.id)
    create(:user_recipe, recipe_id: recipe3.id,
                         user_id: other_user.id)
    create(:user_recipe, recipe_id: recipe4.id,
                         user_id: other_user.id)

    visit favorite_recipes_path

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe2.name
    expect(page).to_not have_content recipe3.name
    expect(page).to_not have_content recipe4.name
  end
  scenario 'user can see their own recipes on favorites' do
    user = login_user
    recipe1 = create(:recipe,
                     name: 'Strogonoff frango',
                     user: user)
    recipe2 = create(:recipe,
                     name: 'Bile a role',
                     user: user)
    recipe3 = create(:recipe,
                     name: 'Pernil Assado',
                     user: user)
    recipe4 = create(:recipe,
                     name: 'Peixe Espada',
                     user: user)

    create(:user_recipe, recipe_id: recipe1.id,
                         user_id: user.id)
    create(:user_recipe, recipe_id: recipe2.id,
                         user_id: user.id)
    create(:user_recipe, recipe_id: recipe3.id,
                         user_id: user.id)
    create(:user_recipe, recipe_id: recipe4.id,
                         user_id: user.id)

    visit favorite_recipes_path

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe3.name
    expect(page).to have_content recipe4.name
  end
end
