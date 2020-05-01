FactoryBot.define do
  factory :dreampost do
    content { 'spec content' }
    association :user
  end
end
