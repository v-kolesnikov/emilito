require 'rails_helper'
require 'support/ticket_context'

describe Ticket::Update do
  describe '.run' do
    include_context 'ticket_context'

    let(:ticket_params) { attributes_for(:ticket) }

    it 'update a exist Ticket' do
      res, op = described_class.run(id: ticket.id, ticket: ticket_params)
      expect(res).to be true
      expect(op.model.persisted?).to be true
    end
  end
end
