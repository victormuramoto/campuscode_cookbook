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
end
