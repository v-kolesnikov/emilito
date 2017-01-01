FactoryGirl.define do
  factory :account do
    skip_create

    initialize_with do
      Account::Create.(account: attributes)['model']
    end
  end
end
