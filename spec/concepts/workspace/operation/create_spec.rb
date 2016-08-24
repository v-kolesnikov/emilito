require 'rails_helper'
require 'support/account_context'
require 'support/shared_examples/operation'

describe Workspace::Create do
  describe '.run' do
    include_context 'account_context'

    let(:workspace_params) do
      attributes_for(:workspace).merge(account_id: account.id)
    end

    let(:params) { { workspace: workspace_params } }

    include_examples 'create operation', Workspace
  end
end
