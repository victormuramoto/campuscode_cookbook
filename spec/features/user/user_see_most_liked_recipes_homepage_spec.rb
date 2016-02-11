require 'rails_helper'
feature 'User see most liked recipes in homepage' do
  scenario 'success without login' do
    user = create(:user)

    recipe1 = create(:recipe,
                     name: 'Strogonoff frango',
                     user: user,
                     likes: 10)
    recipe2 = create(:recipe,
                     name: 'Bile a role',
                     user: user,
                     likes: 8)
    recipe3 = create(:recipe,
                     name: 'Pernil Assado',
                     user: user,
                     likes: 5)
    recipe4 = create(:recipe,
                     name: 'Peixe Espada',
                     user: user,
                     likes: 7)
    recipe5 = create(:recipe,
                     name: 'Folhado de Frango',
                     user: user,
                     likes: 9)
    recipe6 = create(:recipe,
                     name: 'Salmão com feijão',
                     user: user,
                     likes: 2)
    recipe7 = create(:recipe,
                     name: 'Arroz com brocolis',
                     user: user,
                     likes: 4)
    recipe8 = create(:recipe,
                     name: 'Pão de queijo no alho',
                     user: user,
                     likes: 1)

    visit root_path
    within '#favorites' do
      expect(page).to have_content recipe1.name
      expect(page).to have_content recipe2.name
      expect(page).to have_content recipe3.name
      expect(page).to have_content recipe4.name
      expect(page).to have_content recipe5.name
      expect(page).to_not have_content recipe6.name
      expect(page).to_not have_content recipe7.name
      expect(page).to_not have_content recipe8.name
    end
  end
  scenario 'success with login' do
    user = login_user

    recipe1 = create(:recipe,
                     name: 'Strogonoff frango',
                     user: user,
                     likes: 10)
    recipe2 = create(:recipe,
                     name: 'Bile a role',
                     user: user,
                     likes: 8)
    recipe3 = create(:recipe,
                     name: 'Pernil Assado',
                     user: user,
                     likes: 5)
    recipe4 = create(:recipe,
                     name: 'Peixe Espada',
                     user: user,
                     likes: 7)
    recipe5 = create(:recipe,
                     name: 'Folhado de Frango',
                     user: user,
                     likes: 9)
    recipe6 = create(:recipe,
                     name: 'Salmão com feijão',
                     user: user,
                     likes: 2)
    recipe7 = create(:recipe,
                     name: 'Arroz com brocolis',
                     user: user,
                     likes: 4)
    recipe8 = create(:recipe,
                     name: 'Pão de queijo no alho',
                     user: user,
                     likes: 1)

    visit root_path
    within '#favorites' do
      expect(page).to have_content recipe1.name
      expect(page).to have_content recipe2.name
      expect(page).to have_content recipe3.name
      expect(page).to have_content recipe4.name
      expect(page).to have_content recipe5.name
      expect(page).to_not have_content recipe6.name
      expect(page).to_not have_content recipe7.name
      expect(page).to_not have_content recipe8.name
    end
  end
end
