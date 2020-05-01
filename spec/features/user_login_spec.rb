require 'rails_helper'

RSpec.feature 'User Login', type: :feature do
  let(:user) { create(:user) }

  scenario 'ログインができる' do
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button '送信'
    expect(current_path).to eq root_path
  end
end
