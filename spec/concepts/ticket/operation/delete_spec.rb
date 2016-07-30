require 'rails_helper'
require 'support/ticket_context'

describe Ticket::Delete do
  describe '.run' do
    include_context 'ticket_context'

    it 'delete a exist Ticket' do
      res, op = described_class.run(id: ticket.id)
      expect(res).to be true
      expect(op.model.destroyed?).to be true
    end
  end
end
