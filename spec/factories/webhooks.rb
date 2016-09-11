FactoryGirl.define do
  factory :webhook do
    workspace

    name 'web'

    url { Faker::Internet.url }
    test_url { "#{url}/test" }
    ping_url { "#{url}/ping" }

    events { ['create'] }
    active true

    trait(:with_signature) do
      secret { Faker::Lorem.word }
    end
  end
end
