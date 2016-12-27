class Ticket
  class Create < Emilito::Operation::Create
    contract Ticket::Contract::Base

    representer :render, Ticket::Representer::Show

    def model!(options, params:, **)
      options['model'] = Ticket.new(params.slice(:workspace_id))
    end

    def type
      :ticket
    end
  end
end
