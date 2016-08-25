require 'rails_helper'
require 'support/shared_examples/operation'

describe User::Delete do
  describe '.run' do
    let(:user) do
      params = { user: attributes_for(:user, :create_form) }
      User::Create.(params).model
    end

    let(:params) { { id: user.id } }

    include_examples 'delete operation', User
  end
end
