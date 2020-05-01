require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'GET #create' do
    it 'ログインしていないとcreateアクションはloginページへリダイレクトされる' do
      get :create, params: { user_id: user, dreampost_id: other_user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/login")
    end
  end

  describe 'GET #destroy' do
    it 'ログインしていないとdestroyアクションはloginページへリダイレクトされる' do
      get :destroy, params: { id: user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/login")
    end
  end
end