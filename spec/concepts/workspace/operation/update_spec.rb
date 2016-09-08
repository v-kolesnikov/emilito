require 'rails_helper'

describe Workspace::Update do
  describe '.run' do
    include_context 'workspace context'

    let(:workspace_params) { attributes_for(:workspace) }

    it 'update a exist Workspace' do
      _, op = described_class.run(
        id: workspace.id,
        workspace: workspace_params
      )
      expect(op).to be_success
      expect(op.model.persisted?).to be true
    end
  end
end
