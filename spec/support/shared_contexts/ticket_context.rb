require 'rails_helper'
require 'support/shared_contexts/workspace_context'

RSpec.shared_context 'ticket context' do
  include_context 'workspace context'
  let!(:ticket) do
    ticket_params =
      attributes_for(:ticket).merge(
        account_id: account.id,
        workspace_id: workspace.id
      )
    Ticket::Create.(ticket: ticket_params).model
  end
end
