require 'rails_helper'

RSpec.shared_context 'account_context' do
  let(:account) { Account::Create.(attributes_for(:account)).model }
end
