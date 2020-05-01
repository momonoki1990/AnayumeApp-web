require 'rails_helper'

RSpec.describe Like, type: :like do
  let(:like) { create(:like) }

  it 'likeが作成できる' do
    expect(like).to be_valid
  end

  it 'user_idがなければ作成できない' do
    like.user_id = nil
    expect(like).to_not be_valid
  end

  it 'dreampost_idがなければ作成できない' do
    like.dreampost_id = nil
    expect(like).to_not be_valid
  end
end
