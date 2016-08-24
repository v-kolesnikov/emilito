require 'rails_helper'
require 'support/shared_examples/operation'

describe Account::Create do
  describe '.run' do
    let(:params) { { account: attributes_for(:account) } }
    include_examples 'create operation', Account
  end
end
