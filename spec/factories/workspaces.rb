FactoryGirl.define do
  factory :workspace do
    skip_create

    account

    title { Faker::Lorem.word }

    initialize_with do
      Workspace::Create.(workspace: attributes, account_id: account.id)['model']
    end
  end
end
