FactoryBot.define do
  factory :user do
    name { "Test Example" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
    activated { true }
  end
end
