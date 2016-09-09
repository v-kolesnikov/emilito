require 'rails_helper'
require 'support/shared_contexts/workspace_context'
require 'support/shared_examples/operation'

describe Webhook::Representer::Show do
  include_context 'workspace context'

  let(:webhook_params) do
    { name: 'Example webhook',
      url: 'http://example.io/webhooks',
      workspace_id: workspace.id }
  end

  let(:webhook) { Webhook::Create.(webhook: webhook_params).model }

  let(:representer) { Webhook::Representer::Show.new(webhook) }

  shared_examples 'represented' do
    context 'when webhook contains secret: <secret> option' do
      let(:webhook_params) { super().merge(secret: '<secret>') }

      it { is_expected.to include('secret') }
      it { is_expected.not_to include('secret' => webhook.secret) }
    end
  end

  describe '#to_hash' do
    subject(:hash) { representer.to_hash }
    it_behaves_like 'represented'
  end

  describe '#to_json' do
    subject(:json) { JSON.load representer.to_json }
    it_behaves_like 'represented'
  end
end
