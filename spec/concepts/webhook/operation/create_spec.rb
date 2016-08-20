require 'rails_helper'
require 'support/shared_contexts/workspace_context'

describe Webhook::Create, type: :operation do
  describe '.run' do
    include_context 'workspace context'

    let(:webhook_params) do
      attributes_for(:webhook).merge(workspace_id: workspace.id)
    end

    subject(:operation) { Webhook::Create.run(webhook: webhook_params).last }

    context 'when params is valid' do
      it { is_expected.to be_success }

      describe 'model' do
        subject(:model) { operation.model }
        it { is_expected.to be_persisted }
      end
    end

    context 'when optional params not passed' do
      let(:webhook_params) do
        { name: 'web',
          url: Faker::Internet.url,
          workspace_id: workspace.id }
      end

      subject(:model) { operation.model }

      it 'create a new Webhook with defaults' do
        expect(model.name).to eq 'web'
        expect(model.events).to eq ['create']
        expect(model.active).to eq true
      end
    end
  end
end
