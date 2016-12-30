require 'rails_helper'
require 'support/shared_contexts/workspace_context'

RSpec.describe Workspace::Update do
  describe '.call' do
    subject(:res) { Workspace::Update.(params) }

    include_context 'workspace context'

    let(:params) do
      { id: workspace.id,
        workspace: { title: 'New title' } }
    end

    it 'update a exist Workspace' do
      model = res['model']
      is_asserted_by { res.success? }
      is_asserted_by { model.persisted? }
      is_asserted_by { model.title == 'New title' }
    end
  end
end
