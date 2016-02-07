require 'rails_helper'

feature 'user see recipes by food preference' do
  scenario 'user see list of food preferences' do
    food_preference1 = create(:food_preference, name:'Frango')
    food_preference2 = create(:food_preference, name:'Peixe')

    visit root_path

    expect(page).to have_content food_preference1.name
    expect(page).to have_content food_preference2.name
  end
  scenario 'user see list of recipes available by food preference' do
    food_preference1 = create(:food_preference, name:'Frango')
    food_preference2 = create(:food_preference, name:'Peixe')

    recipe1 = create(:recipe,
                      name:'Frango Assado',
                      food_preference: food_preference1)
    recipe2 = create(:recipe,
                      name:'Fricasse de Frango',
                      food_preference: food_preference1)
    recipe3 = create(:recipe,
                      name:'Frango a passarinho',
                      food_preference: food_preference1)
    recipe4 = create(:recipe,
                      name:'Salmão grelhado',
                      food_preference: food_preference2)
    recipe5 = create(:recipe,
                      name:'Sushi de salmão',
                      food_preference: food_preference2)
    recipe6 = create(:recipe,
                      name:'Temaki de salmão',
                      food_preference: food_preference2)

    visit root_path

    click_on food_preference1.name

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe1.food_preference1.name
    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe2.food_preference1.name
    expect(page).to have_content recipe3.name
    expect(page).to have_content recipe3.food_preference1.name

    expect(page).to_not have_content recipe4.name
    expect(page).to_not have_content recipe4.food_preference2.name
    expect(page).to_not have_content recipe5.name
    expect(page).to_not have_content recipe5.food_preference2.name
    expect(page).to_not have_content recipe6.name
    expect(page).to_not have_content recipe6.food_preference2.name
  end
end
