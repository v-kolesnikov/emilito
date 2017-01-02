require 'rails_helper'
require 'support/shared_contexts/account_context'

RSpec.describe Workspace::Create do
  describe '.call' do
    subject(:res) { Workspace::Create.(params) }

    include_context 'account context'

    let(:params) do
      { account_id: account.id,
        workspace: attributes_for(:workspace) }
    end

    it 'returns the operation result' do
      is_asserted_by { res }
      is_asserted_by { res['model'] }
      is_asserted_by { res['contract.default.class'] }
      is_asserted_by { res['representer.render.class'] }
    end

    it 'create a new Workspace' do
      model = res['model']
      is_asserted_by { res.success? }
      is_asserted_by { model.persisted? }
      is_asserted_by { model.is_a? Workspace }
    end
  end
end
