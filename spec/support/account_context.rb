require 'rails_helper'

RSpec.shared_context 'account_context' do
  let!(:account) do
    params = { user: attributes_for(:user, :create_form) }
    Account::Create.(account: params).model
  end
end
