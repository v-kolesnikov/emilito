require 'rails_helper'

RSpec.shared_context 'user context' do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  let!(:user) { create(:user, email: email, password: password) }
end
