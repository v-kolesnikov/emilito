FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :create_form do
      password_confirmation { password }
    end
  end
end
