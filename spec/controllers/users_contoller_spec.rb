require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'GET #new' do
    before do
      get :new
    end

    it 'newアクションが成功する' do
      expect(response).to have_http_status(:ok)
    end

    it 'newアクションがnewページを返す' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    before do
      get :new
    end

    it 'showアクションが成功する' do
      expect(response).to have_http_status(:ok)
    end

    it 'showアクションがshowページを返す' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'indexアクションが成功する' do
      expect(response).to have_http_status(:ok)
    end

    it 'indexアクションがindexページを返す' do
      expect(response).to render_template :index
    end

    it 'ログイン後はindexページにログインユーザーを含まない' do
      expect(controller.instance_variable_get("@users")).to include(user)
      log_in_as(user)
      get :index
      expect(controller.instance_variable_get("@users")).to_not include(user)
    end
  end

  describe 'GET #edit' do
    it 'ログインしていないとeditアクションはloginページへリダイレクトされる' do
      get :edit, params: { id: user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/login")
    end

    it 'ログインユーザーが異なる場合、editアクションはhomeページへリダイレクトされる' do
      log_in_as(other_user)
      get :edit, params: { id: user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/")
    end
  end

  describe 'GET #update' do
    it 'ログインしていないとupdateアクションはloginページへリダイレクトされる' do
      get :update, params: { id: user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/login")
    end

    it 'ログインユーザーが異なる場合、updateアクションはhomeページへリダイレクトされる' do
      log_in_as(other_user)
      get :update, params: { id: user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/")
    end
  end

  describe 'GET #following' do
    it 'ログインしていないとfollowingアクションはloginページへリダイレクトされる' do
      get :following, params: { id: user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/login")
    end
  end

  describe 'GET #followers' do
    it 'ログインしていないとfollowersアクションはloginページへリダイレクトされる' do
      get :followers, params: { id: user }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("http://test.host/login")
    end
  end

  it 'admin属性の編集を許可しない' do
    log_in_as(user)
    expect(user.admin?).to be_falsey
    patch :edit, params: {
      id: user, user: {
        password: "password",
        password_confirmation: "password",
        admin: true
      }
    }
    expect(other_user.admin?).to be_falsey
  end
end
