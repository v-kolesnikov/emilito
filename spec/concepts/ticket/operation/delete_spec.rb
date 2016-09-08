require 'rails_helper'
require 'support/shared_contexts/ticket_context'
require 'support/shared_examples/operation'

describe Ticket::Delete do
  describe '.run' do
    include_context 'ticket context'
    let(:params) { { id: ticket.id } }
    include_examples 'delete operation', Ticket
  end
end
