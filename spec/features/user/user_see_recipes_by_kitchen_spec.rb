require 'rails_helper'

feature 'user see recipes by kitchen' do
  scenario 'user see list of kitchens' do
    kitchen1 = create(:kitchen, name: 'Paulista')
    kitchen2 = create(:kitchen, name: 'Gaúcha')

    visit root_path

    expect(page).to have_content kitchen1.name
    expect(page).to have_content kitchen2.name
  end
  scenario 'user see list of recipes available by kitchen' do
    user = create(:user)
    kitchen1 = create(:kitchen, name: 'Paulista')
    kitchen2 = create(:kitchen, name: 'Gaúcha')

    recipe1 = create(:recipe,
                     name: 'Strogonoff de Frango',
                     kitchen: kitchen1,
                     user:user)
    recipe2 = create(:recipe,
                     name: 'Strogonoff de Carne',
                     kitchen: kitchen1,
                     user:user)
    recipe3 = create(:recipe,
                     name: 'Bife a milanesa',
                     kitchen: kitchen1,
                     user:user)
    recipe4 = create(:recipe,
                     name: 'Entrecot',
                     kitchen: kitchen2,
                     user:user)
    recipe5 = create(:recipe,
                     name: 'Churrasco',
                     kitchen: kitchen2,
                     user:user)
    recipe6 = create(:recipe,
                     name: 'Chimarrão',
                     kitchen: kitchen2,
                     user:user)

    visit root_path

    click_on kitchen1.name

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.kitchen.name
    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe2.kitchen.name
    expect(page).to have_content recipe3.name
    expect(page).to have_content recipe3.kitchen.name

    expect(page).to_not have_content recipe4.name
    expect(page).to_not have_content recipe4.kitchen.name
    expect(page).to_not have_content recipe5.name
    expect(page).to_not have_content recipe5.kitchen.name
    expect(page).to_not have_content recipe6.name
    expect(page).to_not have_content recipe6.kitchen.name
  end
end
