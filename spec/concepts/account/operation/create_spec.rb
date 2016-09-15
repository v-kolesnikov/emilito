require 'rails_helper'
require 'support/shared_examples/operation'

describe Account::Create do
  describe '.run' do
    let(:params) { { account: {} } }

    subject(:operation) { Account::Create.run(params).last }

    include_examples 'create operation', Account
  end
end
