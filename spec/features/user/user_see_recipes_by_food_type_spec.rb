require 'rails_helper'

feature 'user see recipes by food type' do
  scenario 'user see list of food type' do
    food_type1 = create(:food_type, name: 'Entrada')
    food_type2 = create(:food_type, name: 'Sobremesa')

    visit root_path

    expect(page).to have_content food_type1.name
    expect(page).to have_content food_type2.name
  end
  scenario 'user see list of recipes available by food preference' do
    food_type1 = create(:food_type, name: 'Entrada')
    food_type2 = create(:food_type, name: 'Sobremesa')

    recipe1 = create(:recipe,
                     name: 'Ceviche',
                     food_type: food_type1)
    recipe2 = create(:recipe,
                     name: 'Torresmo',
                     food_type: food_type1)
    recipe3 = create(:recipe,
                     name: 'Bruscheta',
                     food_type: food_type1)
    recipe4 = create(:recipe,
                     name: 'Sorvete',
                     food_type: food_type2)
    recipe5 = create(:recipe,
                     name: 'Torta de Morango',
                     food_type: food_type2)
    recipe6 = create(:recipe,
                     name: 'Banana Split',
                     food_type: food_type2)

    visit root_path

    click_on food_type1.name

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.food_type.name
    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe2.food_type.name
    expect(page).to have_content recipe3.name
    expect(page).to have_content recipe3.food_type.name

    expect(page).to_not have_content recipe4.name
    expect(page).to_not have_content recipe4.food_type.name
    expect(page).to_not have_content recipe5.name
    expect(page).to_not have_content recipe5.food_type.name
    expect(page).to_not have_content recipe6.name
    expect(page).to_not have_content recipe6.food_type.name
  end
end
