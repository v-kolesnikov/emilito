require 'rails_helper'
require 'support/shared_examples/operation'

describe Account::Create do
  describe '.run' do
    let(:params) { { account: { user: attributes_for(:user, :create_form) } } }

    include_examples 'create operation', Account

    subject { Account::Create.run(params).last }
  end
end
