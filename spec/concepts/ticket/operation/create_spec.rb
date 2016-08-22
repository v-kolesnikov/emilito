require 'rails_helper'
require 'support/workspace_context'

describe Ticket::Create do
  describe '.run' do
    include_context 'workspace_context'

    let(:ticket_params) do
      attributes_for(:ticket).merge(
        account_id: account.id,
        workspace_id: workspace.id
      )
    end

    it 'create a new Ticket' do
      res, op = described_class.run(ticket: ticket_params)
      expect(res).to be true
      expect(op.model).to be_kind_of Ticket
      expect(op.model.persisted?).to be true
    end
  end
end
