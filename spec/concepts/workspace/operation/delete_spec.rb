require 'rails_helper'
require 'support/shared_contexts/workspace_context'
require 'support/shared_examples/operation'

describe Workspace::Delete do
  describe '.run' do
    include_context 'workspace context'
    let(:params) { { id: workspace.id } }
    include_examples 'delete operation', Workspace
  end
end
