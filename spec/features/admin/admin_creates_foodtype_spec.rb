require 'rails_helper'
feature 'admin creates a foodtype' do
  scenario 'success' do
    admin = login_admin
    food_type = build(:food_type)

    visit new_food_type_path

    fill_in 'food_type[name]', with: food_type.name

    click_on 'submit'

    expect(page).to have_content food_type.name
  end
  scenario 'Redirected to sign in page' do

    visit new_food_type_path

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end
  scenario "fields can't be blank" do
    admin = login_admin
    food_type = build(:food_type)

    visit new_food_type_path
    click_on 'submit'

    expect(page).to have_content t('flash.food_types.create.alert')

  end
end
