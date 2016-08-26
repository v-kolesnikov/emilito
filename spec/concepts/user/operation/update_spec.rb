require 'rails_helper'

describe User::Update do
  describe '.run' do
    let(:user) do
      params = { user: attributes_for(:user, :create_form) }
      User::Create.(params).model
    end

    let(:user_params) { { email: Faker::Internet.email } }

    it 'update exist User' do
      _, op = User::Update.run(id: user.id, user: user_params)
      expect(op).to be_success
      expect(op.model.email).to eq user_params[:email]
    end
  end
end
