require 'rails_helper'
require 'support/workspace_context'

describe Workspace::Delete do
  describe '.run' do
    include_context 'workspace_context'

    it 'delete a exist Workspace' do
      res, op = described_class.run(id: workspace.id)
      expect(res).to be true
      expect(op.model.destroyed?).to be true
    end
  end
end
