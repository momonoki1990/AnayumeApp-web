require 'rails_helper'

RSpec.describe DreampostsController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'GET #create' do
    it 'ログインしていないとcreateアクションはloginページへリダイレクトされる' do
      get :create, params: { id: user }
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

    it '他のユーザーの投稿は削除できない' do
      log_in_as(user)
      get :destroy, params: { id: :other_user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/")
    end
  end
end