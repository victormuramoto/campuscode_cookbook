require 'rails_helper'
feature 'User sends email' do
  scenario 'success' do
    user = create(:user)
    recipe = create(:recipe, user: user)

    visit recipe_path(recipe)

    click_on t('recipes.email.send_email')

    fill_in 'destination_email', with: 'victor.muramoto@gmail.com'
    click_on t('recipes.email.send')
  end
end
