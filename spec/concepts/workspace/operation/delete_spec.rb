require 'rails_helper'
require 'support/workspace_context'
require 'support/shared_examples/operation'

describe Workspace::Delete do
  describe '.run' do
    include_context 'workspace_context'
    let(:params) { { id: workspace.id } }
    include_examples 'delete operation', Workspace
  end
end
