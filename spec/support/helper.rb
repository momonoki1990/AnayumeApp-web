module Helper
  def log_in_as(user)
    session[:user_id] = user.id
  end

  def login(user)
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button '送信', match: :first
    expect(page.has_button?('送信')).to be_truthy
  end
end
