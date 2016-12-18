require 'rails_helper'
require 'support/shared_contexts/workspace_context'

describe Ticket::Create do
  describe '.call' do
    subject(:res) { Ticket::Create.(params) }

    include_context 'workspace context'

    let(:params) do
      { ticket: { title: 'A new ticket',
                  account_id: account.id,
                  workspace_id: workspace.id } }
    end

    it 'returns the operation result' do
      is_asserted_by { res }
      is_asserted_by { res['model'] }
      is_asserted_by { res['contract.default.class'] }
      is_asserted_by { res['representer.render.class'] }
    end

    it 'create a new Ticket' do
      model = res['model']
      is_asserted_by { res.success? }
      is_asserted_by { model.persisted? }
      is_asserted_by { model.is_a? Ticket }
      is_asserted_by { model.workspace_id == workspace.id }
    end
  end
end
