require 'rails_helper'
require 'support/shared_contexts/account_context'

RSpec.shared_context 'workspace context' do
  include_context 'account context'
  let!(:workspace) do
    workspace_params = attributes_for(:workspace).merge(account_id: account.id)
    Workspace::Create.(workspace: workspace_params).model
  end
end
