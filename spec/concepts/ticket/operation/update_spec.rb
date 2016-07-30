require 'rails_helper'
require 'support/ticket_context'

describe Ticket::Update do
  describe '.run' do
    include_context 'ticket_context'

    let(:ticket_params) do
      attributes_for(:ticket).merge(id: ticket.id)
    end

    it 'update a exist Ticket' do
      res, op = described_class.run(ticket_params)
      expect(res).to be true
      expect(op.model.persisted?).to be true
    end
  end
end
