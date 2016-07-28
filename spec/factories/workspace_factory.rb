FactoryGirl.define do
  factory :workspace do
    account
    title Faker::Lorem.word
  end
end
