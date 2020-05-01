require 'rails_helper'

RSpec.feature 'Feature Like', type: :feature do
  before :each do
    create(:dreampost)
  end

  let(:user) { create(:user) }
  let(:user1) { create(:user, id: 1) }

  scenario 'ログイン前はいいねしてもログインページにリダイレクトされる' do
    visit root_path
    expect(page).to have_http_status 200
    first(:css, '.like-btn').click
    expect(page).to have_http_status 200
    expect(page).to have_selector 'h2', text: 'ログイン'
  end

  scenario 'ログイン後にいいねができる' do
    login(user1)
    visit root_path
    expect(page).to have_http_status 200
    create(:dreampost, user_id: user1.id, content: 'spec content')
    visit root_path
    expect(page).to have_content('spec content')
    first(:css, '.like-btn').click
    visit root_path
    expect(page).to have_css('.unlike-btn')
  end
end
