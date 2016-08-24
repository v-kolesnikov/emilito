require 'rails_helper'
require 'support/workspace_context'
require 'support/shared_examples/operation'

describe Ticket::Create do
  describe '.run' do
    include_context 'workspace_context'

    let(:ticket_params) do
      attributes_for(:ticket).merge(
        account_id: account.id,
        workspace_id: workspace.id
      )
    end

    let(:params) { { ticket: ticket_params } }

    include_examples 'create operation', Ticket
  end
end
