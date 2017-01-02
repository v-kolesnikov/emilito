require 'rails_helper'
require 'support/shared_contexts/ticket_context'

RSpec.describe Ticket::Update do
  describe '.call' do
    subject(:res) { Ticket::Update.(params) }

    include_context 'ticket context'

    let(:params) do
      { id: ticket.id, ticket: { title: 'A new ticket title' } }
    end

    it 'update a exist Ticket' do
      model = res['model']
      is_asserted_by { res.success? }
      is_asserted_by { model.id == ticket.id }
      is_asserted_by { model.title == 'A new ticket title' }
    end
  end
end
