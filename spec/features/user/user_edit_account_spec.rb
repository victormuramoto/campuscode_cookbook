require 'rails_helper'
feature 'User edit account' do
  scenario 'success' do
    kitchen1 = create(:kitchen, name: 'Paulista')
    kitchen2 = create(:kitchen, name: 'Gaucha')
    kitchen3 = create(:kitchen, name: 'Nordestina')

    new_user = build(:user,
                     email: 'rotciv@gmail.com',
                     password: '12345678',
                     password_confirmation: '12345678',
                     first_name: 'rotciv',
                     last_name: 'Muramoto',
                     city: 'Porto Alegre',
                     facebook: 'www.faceasdsabook.com.br',
                     twitter: 'www.twittasdasdsaer.com.br')

    user = login_user
    create(:kitchens_user, kitchen_id: kitchen1.id,
                           user_id: user.id)

    visit edit_user_registration_path

    fill_in 'user[first_name]', with: new_user.first_name
    fill_in 'user[last_name]', with: new_user.last_name
    fill_in 'user[email]', with: new_user.email
    fill_in 'user[password]', with: new_user.password
    fill_in 'user[password_confirmation]', with: new_user.password_confirmation
    fill_in 'user[city]', with: new_user.city
    fill_in 'user[facebook]', with: new_user.facebook
    fill_in 'user[twitter]', with: new_user.twitter
    check(kitchen2.name)

    click_on t('users.buttons.update')

    expect(page).to have_content t('devise.registrations.updated')

    visit edit_user_registration_path

    expect(page).to have_field(t('users.fields.first_name'),
                               with: new_user.first_name)
    expect(page).to have_field(t('users.fields.last_name'),
                               with: new_user.last_name)
    expect(page).to have_field(t('users.fields.city'),
                               with: new_user.city)
    expect(page).to have_field(t('users.fields.facebook'),
                               with: new_user.facebook)
    expect(page).to have_field(t('users.fields.twitter'),
                               with: new_user.twitter)
    expect(page).to have_field(t('users.fields.email'),
                               with: new_user.email)
    expect(find('#user_kitchen_ids_2')).to be_checked
    expect(find('#user_kitchen_ids_1')).to be_checked
    expect(find('#user_kitchen_ids_3')).to_not be_checked
  end
  scenario 'success unchecking kitchens' do
    kitchen1 = create(:kitchen, name: 'Paulista')
    kitchen2 = create(:kitchen, name: 'Gaucha')
    kitchen3 = create(:kitchen, name: 'Nordestina')

    new_user = build(:user,
                     email: 'rotciv@gmail.com',
                     password: '12345678',
                     password_confirmation: '12345678',
                     first_name: 'rotciv',
                     last_name: 'Muramoto',
                     city: 'Porto Alegre',
                     facebook: 'www.faceasdsabook.com.br',
                     twitter: 'www.twittasdasdsaer.com.br')

    user = login_user
    create(:kitchens_user, kitchen_id: kitchen1.id,
                           user_id: user.id)
    create(:kitchens_user, kitchen_id: kitchen2.id,
                           user_id: user.id)
    create(:kitchens_user, kitchen_id: kitchen3.id,
                           user_id: user.id)

    visit edit_user_registration_path

    fill_in 'user[first_name]', with: new_user.first_name
    fill_in 'user[last_name]', with: new_user.last_name
    fill_in 'user[email]', with: new_user.email
    fill_in 'user[password]', with: new_user.password
    fill_in 'user[password_confirmation]', with: new_user.password_confirmation
    fill_in 'user[city]', with: new_user.city
    fill_in 'user[facebook]', with: new_user.facebook
    fill_in 'user[twitter]', with: new_user.twitter
    uncheck('Gaucha')
    uncheck('Paulista')

    click_on t('users.buttons.update')

    expect(page).to have_content t('devise.registrations.updated')

    visit edit_user_registration_path

    expect(page).to have_field(t('users.fields.first_name'),
                               with: new_user.first_name)
    expect(page).to have_field(t('users.fields.last_name'),
                               with: new_user.last_name)
    expect(page).to have_field(t('users.fields.city'),
                               with: new_user.city)
    expect(page).to have_field(t('users.fields.facebook'),
                               with: new_user.facebook)
    expect(page).to have_field(t('users.fields.twitter'),
                               with: new_user.twitter)
    expect(page).to have_field(t('users.fields.email'), with: new_user.email)
    expect(find('#user_kitchen_ids_2')).to_not be_checked
    expect(find('#user_kitchen_ids_1')).to_not be_checked
    expect(find('#user_kitchen_ids_3')).to be_checked
  end
  scenario 'fields cannot be blank' do
    kitchen1 = create(:kitchen, name: 'Paulista')
    kitchen2 = create(:kitchen, name: 'Gaucha')
    kitchen3 = create(:kitchen, name: 'Nordestina')

    new_user = build(:user,
                     email: 'rotciv@gmail.com',
                     password: '12345678',
                     password_confirmation: '12345678',
                     first_name: 'rotciv',
                     last_name: 'Muramoto',
                     city: 'Porto Alegre',
                     facebook: 'www.faceasdsabook.com.br',
                     twitter: 'www.twittasdasdsaer.com.br')

    user = login_user
    create(:kitchens_user, kitchen_id: kitchen1.id,
                           user_id: user.id)

    visit edit_user_registration_path

    fill_in 'user[first_name]', with: ''
    fill_in 'user[last_name]', with: ''
    fill_in 'user[email]', with: ''
    fill_in 'user[password]', with: ''
    fill_in 'user[password_confirmation]', with: new_user.password_confirmation
    fill_in 'user[city]', with: new_user.city
    fill_in 'user[facebook]', with: new_user.facebook
    fill_in 'user[twitter]', with: new_user.twitter
    check(kitchen2.name)

    click_on t('users.buttons.update')

    expect(page).to have_content t('errors.messages.not_saved.other')
  end
end
