require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  it 'ユーザー登録が可能である' do
    expect(user).to be_valid
  end
  
  it "名前とメールアドレスとパスワードがあれば登録できる" do
    expect(user).to be_valid
  end

  it "名前がなければ登録できない" do
    expect(build(:user, name: "")).to_not be_valid
  end

  it "メールアドレスがなければ登録できない" do
    expect(build(:user, email: "")).to_not be_valid
  end

  it "メールアドレスが重複していたら登録できない" do
    user1 = create(:user, name: "taro", email: "taro@example.com")
    expect(build(:user, name: "ziro", email: user1.email)).to_not be_valid
  end

  it "パスワードがなければ登録できない" do
    expect(build(:user, password: "")).to_not be_valid
  end

  it "パスワードが暗号化されているか" do
    expect(user.password_digest).to_not eq "password"
  end

  it "password_confirmationとpasswordが異なる場合保存できない" do
    expect(build(:user, password: "password", password_confirmation: "passward")).to_not be_valid
  end

  it "パスワードが6文字未満の場合保存できない" do
    expect(build(:user, password: "a" * 5)).to_not be_valid
    expect(build(:user, password: "b" * 6)).to be_valid
  end

  it "メールアドレスの形式が~@~.~の形式であれば登録できる" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      expect(build(:user, email: valid_address)).to be_valid
    end
  end

  it "メールアドレスの形式が~@~.~の形式でなければ登録できない" do
    invalid_addresses = %w[useruser sample.foo baz@foo ......@.......]
    invalid_addresses.each do |_invalid_address|
      expect(build(:user, email: invalid_addresses)).to_not be_valid
    end
  end

  it "メールアドレスは小文字で保存される" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    user = create(:user, email: mixed_case_email)
    expect(user.email).to eq mixed_case_email.downcase
  end

  it "authenticated?ヘルパーメソッドはremember digestがnilの場合にfalseを返す" do    
    expect(user.authenticated?(:remember, "")).to be_falsey
  end

  it "フォローとフォロー解除が正常に行われる" do
    user1 = create(:user, name: "taro", email: "taro@example.com")
    user2 = create(:user, name: "ziro", email: "ziro@example.com")
    expect(user1.following?(user2)).to be_falsey
    user1.follow(user2)
    expect(user1.following?(user2)).to be_truthy
    user1.unfollow(user2)
    expect(user1.following?(user2)).to be_falsey
  end
end
