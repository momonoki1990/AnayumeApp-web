require 'rails_helper'

RSpec.feature 'User Signup', type: :feature do

  scenario 'ユーザーの新規登録ができる' do
    visit signup_path
    fill_in 'user_name', with: 'test user'
    fill_in 'user_email', with: 'test_user@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_field', with: 'password'
    click_button '送信'
    expect(page).to have_content "送信されたメールをご確認ください。"
    expect(current_path).to eq root_path
  end
end