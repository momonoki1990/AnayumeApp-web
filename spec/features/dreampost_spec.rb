require 'rails_helper'

RSpec.feature 'Feature Dreampost', type: :feature do
  let(:user) { create(:user) }

  scenario '投稿を作成、投稿を削除' do
    login(user)
    visit root_path
    fill_in 'dreampost_content', with: 'test message'
    click_button '送信', match: :first
    visit root_path
    expect(page).to have_content('test message')
    click_button 'dropdownMenuButton', match: :first
    click_link '削除する', match: :first
    visit root_path
    expect(page).to_not have_content('test message')
  end
end
