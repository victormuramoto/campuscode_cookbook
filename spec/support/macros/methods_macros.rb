module MethodsMacros
  def login_admin
    admin = create(:admin)
    visit new_admin_session_path

    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password

    click_on 'Log in'
    admin
  end

  def login_user
    user = create(:user)
    visit new_user_session_path

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    click_on 'Log in'
    user
  end
end
