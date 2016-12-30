FactoryGirl.define do
  factory :ticket do
    skip_create

    workspace

    title { Faker::Hipster.sentence }

    initialize_with do
      Ticket::Create.(ticket: attributes, workspace_id: workspace.id)['model']
    end
  end
end
