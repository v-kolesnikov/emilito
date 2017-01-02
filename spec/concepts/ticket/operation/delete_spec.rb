require 'rails_helper'
require 'support/shared_contexts/ticket_context'

RSpec.describe Ticket::Delete do
  describe '.call' do
    subject(:res) { Ticket::Delete.(params) }

    include_context 'ticket context'

    let(:params) { { id: ticket.id } }

    it 'delete a exist Workspace' do
      model = res['model']
      is_asserted_by { res.success? }
      is_asserted_by { model.destroyed? }
    end
  end
end
