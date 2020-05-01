require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #home' do
    before do
      get :home
    end

    it 'homeアクションが成功する' do
      expect(response).to have_http_status(:ok)
    end

    it 'homeアクションがhomeページを返す' do
      expect(response).to render_template :home
    end
  end
end
