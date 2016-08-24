require 'rails_helper'
require 'support/ticket_context'
require 'support/matchers/be_success'

describe Ticket::Update do
  describe '.run' do
    include_context 'ticket_context'

    let(:ticket_params) { attributes_for(:ticket) }

    it 'update a exist Ticket' do
      _, op = described_class.run(id: ticket.id, ticket: ticket_params)
      expect(op).to be_success
      expect(op.model.persisted?).to be true
    end
  end
end
