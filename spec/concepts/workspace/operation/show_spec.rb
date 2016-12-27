require 'rails_helper'
require 'support/shared_contexts/workspace_context'

describe Workspace::Show do
  describe '.call' do
    subject(:result) { Workspace::Show.(params) }

    include_context 'workspace context'

    let(:params) { { id: workspace.id } }

    it 'present Workspace model' do
      is_asserted_by { result.success? }
      is_asserted_by { result['model'] == workspace }
    end
  end
end
