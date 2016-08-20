require 'rails_helper'
require 'support/shared_contexts/workspace_context'

describe Webhook::Update, type: :operation do
  describe '.run' do
    include_context 'workspace context'

    let(:webhook) do
      Webhook::Create.(
        webhook: attributes_for(:webhook).merge(workspace_id: workspace.id)
      ).model
    end

    subject(:operation) do
      Webhook::Update.run(id: webhook.id, webhook: webhook_params).last
    end

    context 'when params is valid' do
      let(:webhook_params) do
        { name: 'a new webhook name',
          events: ['create', 'update'],
          url: Faker::Internet.url,
          ping_url: Faker::Internet.url,
          test_url: Faker::Internet.url,
          active: false }
      end

      it 'update a exists Webhook from params' do
        is_expected.to be_success
        expect(operation.model.persisted?).to be true

        expect(operation.model.url).to      eq webhook_params[:url]
        expect(operation.model.name).to     eq webhook_params[:name]

        expect(operation.model.events).to   eq webhook_params[:events]
        expect(operation.model.active).to   eq false

        expect(operation.model.ping_url).to eq webhook_params[:ping_url]
        expect(operation.model.test_url).to eq webhook_params[:test_url]
      end
    end

    describe 'update subscribed events' do
      subject(:events) { operation.model.events }

      context 'when :add_events param is passed' do
        let(:webhook_params) do
          { id: webhook.id, add_events: ['update'] }
        end

        it 'add passed events to exists events' do
          is_expected.to eq ['create', 'update']
        end
      end

      context 'when :remove_events param is passed' do
        let(:webhook_params) do
          { id: webhook.id, remove_events: ['create'] }
        end

        it 'takes passed events from exists events' do
          is_expected.to eq []
        end
      end

      context 'when :add_events and :remove_events params is passed' do
        let(:webhook_params) do
          { id: webhook.id,
            add_events: ['update', 'delete'],
            remove_events: ['create', 'update'] }
        end

        it 'first add and then takes passed events' do
          is_expected.to eq ['delete']
        end
      end

      context 'when :events, :add_events and :remove_events params is passed' do
        let(:webhook_params) do
          { id: webhook.id,
            events: ['create', 'liked'],
            add_events: ['update', 'delete'],
            remove_events: ['create', 'update'] }
        end

        it 'set :events then add :add_events and then take :remove_events' do
          is_expected.to eq ['liked', 'delete']
        end
      end
    end # update events
  end
end
