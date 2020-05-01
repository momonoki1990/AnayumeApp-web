require 'rails_helper'

RSpec.feature 'Feature Search', type: :feature do

  scenario '投稿の検索ができる' do
    visit root_path
    create(:dreampost, content: 'search word')
    create(:dreampost, content: 'no search')
    fill_in 'dreampost_search', with: 'search word'
    click_button '検索'
    expect(page).to have_content('search word')
    expect(page).to_not have_content('no search')
  end
end
