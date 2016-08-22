require 'rails_helper'

describe Account::Create do
  describe '.run' do
    let(:account_params) { attributes_for(:account) }

    it 'create a new Account' do
      res, op = described_class.run(account: account_params)
      expect(res).to be true
      expect(op.model).to be_kind_of Account
      expect(op.model.persisted?).to be true
    end
  end
end
