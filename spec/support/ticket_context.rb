require 'rails_helper'
require 'support/workspace_context'

RSpec.shared_context 'ticket_context' do
  include_context 'workspace_context'
  let!(:ticket) do
    ticket_params =
      attributes_for(:ticket).merge(
        account_id: account.id,
        workspace_id: workspace.id
      )
    Ticket::Create.(ticket_params).model
  end
end
