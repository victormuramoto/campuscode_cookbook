require 'rails_helper'
feature 'User sign up' do
  scenario 'success without kitchens' do
    user = build(:user,
                   email:'victor@gmail.com',
                   password:'12345678',
                   password_confirmation:'12345678',
                   first_name: 'Victor',
                   last_name: 'Muramoto',
                   city: 'São Paulo',
                   facebook: 'www.facebook.com.br',
                   twitter: 'www.twitter.com.br')

    visit new_user_registration_path

    fill_in 'user[first_name]', with: user.first_name
    fill_in 'user[last_name]', with: user.last_name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    fill_in 'user[city]', with: user.city
    fill_in 'user[facebook]', with: user.facebook
    fill_in 'user[twitter]', with: user.twitter

    click_on t('users.buttons.sign_up')

    expect(page).to have_content t('devise.registrations.signed_up')
  end
  scenario 'success with kitchens' do
    create(:kitchen, name:'Paulista')
    create(:kitchen, name:'Gaucha')
    create(:kitchen, name:'Carioca')
    create(:kitchen, name:'Nordestina')
    user = build(:user,
                   email:'victor@gmail.com',
                   password:'12345678',
                   password_confirmation:'12345678',
                   first_name: 'Victor',
                   last_name: 'Muramoto',
                   city: 'São Paulo',
                   facebook: 'www.facebook.com.br',
                   twitter: 'www.twitter.com.br')

    visit new_user_registration_path

    fill_in 'user[first_name]', with: user.first_name
    fill_in 'user[last_name]', with: user.last_name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    fill_in 'user[city]', with: user.city
    fill_in 'user[facebook]', with: user.facebook
    fill_in 'user[twitter]', with: user.twitter
    check('Gaucha')
    check('Carioca')
    check('Nordestina')
    check('Paulista')


    click_on t('users.buttons.sign_up')

    expect(page).to have_content t('devise.registrations.signed_up')
  end
  scenario 'invalid data' do
    create(:kitchen, name:'Paulista')
    create(:kitchen, name:'Gaucha')
    create(:kitchen, name:'Carioca')
    create(:kitchen, name:'Nordestina')
    user = build(:user,
                   email:'victor@gmail.com',
                   password:'12345678',
                   password_confirmation:'12345678',
                   first_name: 'Victor',
                   last_name: 'Muramoto',
                   city: 'São Paulo',
                   facebook: 'www.facebook.com.br',
                   twitter: 'www.twitter.com.br')

    visit new_user_registration_path

    fill_in 'user[password_confirmation]', with: user.password_confirmation
    fill_in 'user[city]', with: user.city
    fill_in 'user[facebook]', with: user.facebook
    fill_in 'user[twitter]', with: user.twitter
    check('Gaucha')
    check('Carioca')
    check('Nordestina')
    check('Paulista')


    click_on t('users.buttons.sign_up')

    expect(page).to have_content t('devise.errors.messages.not_saved.others')
  end

end
