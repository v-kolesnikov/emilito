require 'rails_helper'
require 'support/account_context'

RSpec.shared_context 'workspace_context' do
  include_context 'account_context'
  let!(:workspace) do
    workspace_params = attributes_for(:workspace).merge(account_id: account.id)
    Workspace::Create.(workspace_params).model
  end
end
