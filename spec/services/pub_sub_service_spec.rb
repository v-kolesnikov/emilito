require 'rails_helper'

describe PubSubService, type: :service do
  let(:publisher) do
    Class.new do
      include PubSubService::PublisherMixin
    end.new
  end

  describe 'subscriber' do
    subject!(:subscriber) do
      Class.new do
        include PubSubService::SubscriberMixin

        @events = []
        @last_event = nil

        def self.on_event(event)
          @events << @last_event = event
        end

        def self.recieved_events
          @events
        end
      end
    end

    context 'when publisher emit :example_event' do
      before { publisher.emit(:example_event) }

      it { is_expected.to be_receive_msg(:example_event) }
    end
  end
end

RSpec::Matchers.define :be_receive_msg do |expected|
  match do |actual|
    actual.recieved_events.last == expected
  end

  failure_message do
    "not receive message: #{expected}"
  end
end
