require 'rails_helper'
feature 'admin creates a kitchen' do
  scenario 'success' do
    admin = login_admin
    kitchen = build(:kitchen)

    visit new_kitchen_path

    fill_in 'kitchen[name]', with: kitchen.name

    click_on 'submit'

    expect(page).to have_content kitchen.name
  end
  scenario 'Redirected to sign in page' do

    visit new_kitchen_path

    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end
  scenario "fields can't be blank" do
    admin = login_admin
    kitchen = build(:kitchen)

    visit new_kitchen_path
    click_on 'submit'

    expect(page).to have_content t('flash.kitchens.create.alert')

  end
end
