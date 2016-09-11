require 'rails_helper'

describe WebhookService, type: :service do
  describe WebhookService::Monitor do
    describe '.on_event' do
      before { PubSubService::Observer.process_event(:update) }

      let(:jobs) { WebhookService::Worker.jobs }

      it 'enque background job' do
        expect(jobs.count).to eq 1
      end
    end
  end
end
