require 'rails_helper'

RSpec.describe User::Update do
  describe '.call' do
    subject(:res) { User::Update.(params) }

    let(:user) do
      User::Create.(user: attributes_for(:user))['model']
    end

    let(:params) do
      { id: user.id, user: { email: Faker::Internet.email } }
    end

    it 'update a exist User' do
      model = res['model']
      is_asserted_by { res.success? }
      is_asserted_by { model.id == user.id }
      is_asserted_by { model.email == params[:user][:email] }
    end
  end
end
