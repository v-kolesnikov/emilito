FactoryGirl.define do
  factory :ticket do
    title { Faker::Hipster.sentence }
  end
end
