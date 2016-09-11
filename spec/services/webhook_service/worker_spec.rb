require 'rails_helper'
require 'support/shared_contexts/workspace_context'

describe WebhookService::Worker do
  include_context 'workspace context'

  let(:webhook) do
    Webhook::Create.(
      webhook: attributes_for(:webhook)
      .merge(workspace_id: workspace.id)
    ).model
  end

  let(:worker) { WebhookService::Worker.new }

  describe '#perform' do
    before { stub_request(:post, webhook.url).to_return(status: 200) }

    subject! { worker.perform(webhook.events[0]) }

    it { expect(WebMock).to have_requested(:post, webhook.url) }
  end
end
