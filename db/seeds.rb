# frozen_string_literal: true

# ユーザー
User.create!(name: "Example User",
        email: "example@example.com",
        password:           "sample",
        password_confirmation: "sample",
        admin: true,
        activated: true,
        activated_at: Time.zone.now,
        profile: "猫が好きです。")

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "sample"
  profile = Faker::Lorem.sentence(5)
  User.create!(name: name,
          email: email,
          password: password,
          password_confirmation: password,
          activated: true,
          activated_at: Time.zone.now,
          profile: profile)
end

# ドリームポスト
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.dreamposts.create!(content: content)}
end

# リレーションシップ
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }