require 'rails_helper'

RSpec.shared_context 'account_context' do
  let!(:account) { Account::Create.(account: attributes_for(:account)).model }
end
