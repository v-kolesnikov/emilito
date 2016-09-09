require 'rails_helper'
require 'webmock_helper'
require 'support/shared_contexts/workspace_context'
require 'support/shared_examples/operation'

describe WebhookDelivery::Create do
  describe '.run' do
    include_context 'workspace context'

    let(:webhook) do
      Webhook::Create.(webhook: { name: 'Example webhook',
                                  url: 'http://example.io/webhooks',
                                  workspace_id: workspace.id }).model
    end

    let(:params) { { webhook_delivery: { webhook_id: webhook.id } } }

    subject(:operation) { WebhookDelivery::Create.run(params).last }

    before { stub_request(:post, webhook.url).to_return(status: 200) }

    include_examples 'create operation', WebhookDelivery

    describe 'request headers' do
      subject(:headers) { operation.model.request['headers'] }

      it { is_expected.to include('Content-Type' => 'application/json') }
      it { is_expected.to include('User-Agent' => 'Emilito-Hookshot') }
      it { is_expected.to include('X-Emilito-Event') }
      it { is_expected.to include('X-Emilito-Delivery' => operation.model.id) }

      context 'when Webhook not to include :secret option' do
        it { is_expected.not_to include('X-Emilito-Signature') }
      end

      context 'when Webhook include :secret option' do
        let(:webhook_secret) { 'Eagle gift' }

        let(:webhook) do
          Webhook::Create.(webhook: { name: 'Example webhook',
                                      url: 'http://example.io/webhooks',
                                      secret: webhook_secret,
                                      workspace_id: workspace.id }).model
        end

        let(:digest) do
          sha1_digest = OpenSSL::Digest.new('sha1')
          data = operation.model.request['payload']
          OpenSSL::HMAC.hexdigest(sha1_digest, webhook_secret, data)
        end

        it { is_expected.to include('X-Emilito-Signature' => "sha1=#{digest}") }
      end
    end

    describe 'request payload' do
      subject(:payload) { operation.model.request['payload'] }
      it { is_expected.to be }
    end

    context 'during execution' do
      before do
        stub_request(:post, webhook.url).to_return(status: 200)
      end

      it do
        expect(WebMock).to have_requested(:post, webhook.url)
          .with(headers: subject.model.request['headers'])
      end
    end

    describe 'request response' do
      let(:response) do
        {
          status: 200,
          headers: {
            'date' => Time.current.to_s,
            'request-id' => SecureRandom.uuid
          },
          body: 'OK'
        }
      end

      before { stub_request(:post, webhook.url).to_return(response) }

      subject(:request_response) { operation.model.response }

      it { is_expected.not_to be_empty }
      it { is_expected.to include('status' => 200) }
      it { is_expected.to include('headers' => response[:headers]) }
      it { is_expected.to include('body' => 'OK') }
    end
  end
end
