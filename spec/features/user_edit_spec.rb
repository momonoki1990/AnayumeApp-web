require 'rails_helper'

RSpec.feature 'User Edit', type: :feature do
  let(:user) { create(:user) }
  
  scenario 'ユーザー情報が編集できる' do
    login(user)
    visit edit_user_path(user)
    fill_in 'user_profile', with: 'test profile'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_field', with: 'password'
    click_button '送信'
    visit user_path(user)
    expect(page).to have_content('test profile')
  end
end