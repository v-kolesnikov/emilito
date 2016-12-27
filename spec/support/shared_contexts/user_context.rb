require 'rails_helper'

RSpec.shared_context 'user context' do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  let!(:current_user) do
    User::Create.(user: { email: email, password: password })['model']
  end
end
