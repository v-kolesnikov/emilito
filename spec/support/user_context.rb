require 'rails_helper'

RSpec.shared_context 'user_context' do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  let!(:current_user) do
    user_params = { email: email, password: password }
    User::Create.(user: user_params).model
  end
end
