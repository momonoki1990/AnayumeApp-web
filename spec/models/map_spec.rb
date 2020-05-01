require 'rails_helper'

RSpec.describe Map, type: :model do
  let(:map) { create(:map) }

  it 'mapが保存できる' do
    expect(map).to be_valid
  end

  it 'latitudeがなければ保存できない' do
    map.latitude = nil
    expect(map).to_not be_valid
  end
  
  it 'longitudeがなければ保存できない' do
    map.longitude = nil
    expect(map).to_not be_valid
  end

  it 'titleがなければ保存できない' do
    map.title = nil
    expect(map).to_not be_valid
  end

  it 'user_idがなければ保存できない' do
    map.user_id = nil
    expect(map).to_not be_valid
  end

  it '投稿は降順で保存される' do
    create(:map, title: "first")
    create(:map, title: "second")
    create(:map, title: "third")
    expect(Map.first.title).to eq "third"
  end
end
