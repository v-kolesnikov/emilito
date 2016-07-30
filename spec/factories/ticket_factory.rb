FactoryGirl.define do
  factory :ticket do
    account
    workspace
    title { Faker::Lorem.word }
  end
end
