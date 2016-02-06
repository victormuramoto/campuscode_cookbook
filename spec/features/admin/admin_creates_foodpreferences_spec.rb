require 'rails_helper'
feature 'admin creates a food_preference' do
  scenario 'success' do
    admin = login_admin
    food_preference = build(:food_preference)

    visit new_food_preference_path

    fill_in 'food_preference[name]', with: food_preference.name

    click_on 'submit'

    expect(page).to have_content food_preference.name
  end
  scenario 'Redirected to sign in page' do

    visit new_food_preference_path

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end
  scenario "fields can't be blank" do
    admin = login_admin
    food_preference = build(:food_preference)

    visit new_food_preference_path
    click_on 'submit'

    expect(page).to have_content t('flash.food_preferences.create.alert')

  end
end
