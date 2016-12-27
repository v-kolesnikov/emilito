require 'rails_helper'
require 'support/shared_contexts/workspace_context'

RSpec.shared_context 'ticket context' do
  include_context 'workspace context'

  let!(:ticket) do
    Ticket::Create.(
      account_id: account.id,
      workspace_id: workspace.id,
      ticket: attributes_for(:ticket)
    )['model']
  end
end
