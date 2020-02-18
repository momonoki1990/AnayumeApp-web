# frozen_string_literal: true

User.create!(name: "Example User",
        email: "example@example.com",
        password:           "sample",
        password_confirmation: "sample",
        admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "sample"
  User.create!(name: name,
          email: email,
          password: password,
          password_confirmation: password)
end