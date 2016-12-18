class Ticket
  class Create < Emilito::Operation::Create
    contract Ticket::Contract::Base

    representer :render, Ticket::Representer::Show

    def model!(options, **)
      options['model'] = Ticket.new
    end

    def type
      :ticket
    end
  end
end
