require 'rails_helper'
require 'support/shared_contexts/account_context'

RSpec.shared_context 'workspace context' do
  include_context 'account context'

  let!(:workspace) do
    params = { workspace: attributes_for(:workspace), account_id: account.id }
    Workspace::Create.(params)['model']
  end
end
