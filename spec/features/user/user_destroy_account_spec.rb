require 'rails_helper'
feature 'User creates a recipe' do
  scenario 'success' do
    user = login_user

    visit edit_user_registration_path

    click_on t('users.buttons.cancel')

    expect(page).to have_content t('devise.registrations.destroyed')
  end
end
