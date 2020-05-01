require 'rails_helper'

RSpec.feature 'Feature Following', type: :feature do
  before do
    create(:user, name: 'other_user')
  end

  let(:user) { create(:user) }

  scenario 'フォロー、フォロー解除ができる' do
    login(user)
    visit users_path
    expect(page).to have_link('other_user')
    expect(page).to have_button('フォロー')
    click_button 'フォロー', match: :first
    visit following_user_path(user)
    expect(page).to have_link('other_user')
    visit users_path
    expect(page).to have_link('other_user')
    expect(page).to have_button('フォロー解除')
    click_button 'フォロー解除', match: :first
    visit following_user_path(user)
    expect(page).to_not have_link('other_user')
  end
end
