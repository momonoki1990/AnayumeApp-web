require 'rails_helper'

RSpec.describe DreampostsController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'GET #create' do
    it 'ログインしていないとcreateアクションはloginページへリダイレクトされる' do
      get :create, params: { follower_id: user, followed_id: other_user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/login")
    end
  end

  describe 'GET #create' do
    it 'ログインしていないとcreateアクションはloginページへリダイレクトされる' do
      get :create, params: { follower_id: user, followed_id: other_user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/login")
    end
  end
end
