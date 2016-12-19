require 'rails_helper'
require 'support/shared_contexts/workspace_context'

describe Workspace::Delete do
  describe '.call' do
    subject(:res) { Workspace::Delete.(params) }

    include_context 'workspace context'

    let(:params) { { id: workspace.id } }

    it 'delete a exist Workspace' do
      model = res['model']
      is_asserted_by { res.success? }
      is_asserted_by { model.destroyed? }
    end
  end
end
