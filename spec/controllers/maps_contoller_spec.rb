require 'rails_helper'

RSpec.describe MapsController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'GET #index' do
    it 'ログインしていないとindexアクションはloginページへリダイレクトされる' do
      get :index
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/login")
    end
  end

  describe 'GET #create' do
    it 'ログインしていないとcreateアクションはloginページへリダイレクトされる' do
      get :create
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
