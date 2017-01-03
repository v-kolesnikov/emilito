require 'rails_helper'
require 'support/shared_contexts/workspace_context'

RSpec.describe WebhookService::Worker do
  include_context 'workspace context'

  let(:webhook) { create(:webhook, workspace: workspace) }

  let(:worker) { WebhookService::Worker.new }

  describe '#perform' do
    before { stub_request(:post, webhook.url).to_return(status: 200) }

    subject! { worker.perform(webhook.events[0]) }

    it { expect(WebMock).to have_requested(:post, webhook.url) }
  end
end
