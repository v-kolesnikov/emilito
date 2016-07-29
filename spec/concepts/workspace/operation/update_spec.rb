require 'rails_helper'
require 'support/workspace_context'

describe Workspace::Update do
  describe '.run' do
    include_context 'workspace_context'

    let(:workspace_params) do
      attributes_for(:workspace).merge(id: workspace.id)
    end

    it 'update a exist Workspace' do
      res, op = described_class.run(workspace_params)
      expect(res).to be true
      expect(op.model.persisted?).to be true
    end
  end
end
