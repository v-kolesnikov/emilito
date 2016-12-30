FactoryGirl.define do
  factory :user do
    skip_create

    email { Faker::Internet.email }
    login { Faker::Internet.user_name }
    password { Faker::Internet.password }

    trait :create_form do
      password_confirmation { password }
    end

    initialize_with do
      User::SignUp.(user: attributes)['model']
    end
  end
end
