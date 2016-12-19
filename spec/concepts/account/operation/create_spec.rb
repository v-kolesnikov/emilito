require 'rails_helper'

describe Account::Create do
  describe '.call' do
    subject(:res) { Account::Create.(params) }

    let(:params) { { account: {} } }

    it 'returns the operation result' do
      is_asserted_by { res }
      is_asserted_by { res['model'] }
      is_asserted_by { res['contract.default.class'] }
    end

    it 'create a new Account' do
      model = res['model']
      is_asserted_by { res.success? }
      is_asserted_by { model.persisted? }
      is_asserted_by { model.is_a? Account }
    end
  end
end
