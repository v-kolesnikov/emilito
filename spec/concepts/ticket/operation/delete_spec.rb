require 'rails_helper'
require 'support/ticket_context'
require 'support/shared_examples/operation'

describe Ticket::Delete do
  describe '.run' do
    include_context 'ticket_context'
    let(:params) { { id: ticket.id } }
    include_examples 'delete operation', Ticket
  end
end
