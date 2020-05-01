require 'rails_helper'

RSpec.describe Dreampost, type: :model do
  let(:dreampost) { create(:dreampost) }

  it '投稿が可能である' do
    expect(dreampost).to be_valid
  end

  it 'user_idがなければ投稿できない' do
    dreampost.user_id = nil
    dreampost.valid?
    expect(dreampost.errors).to be_added(:user_id, :blank)
  end

  it 'contentがなければ投稿できない' do
    dreampost.content = nil
    dreampost.valid?
    expect(dreampost.errors).to be_added(:content, :blank)
  end

  it 'in_reply_toはデフォルトで0' do
    expect(dreampost.in_reply_to).to eq 0
  end

  it '投稿は降順で保存される' do
    create(:dreampost, content: "first")
    create(:dreampost, content: "second")
    create(:dreampost, content: "third")
    expect(Dreampost.first.content).to eq "third"
  end
end
