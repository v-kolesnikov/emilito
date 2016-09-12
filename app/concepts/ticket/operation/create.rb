class Ticket
  class Create < Emilito::Operation::Create
    model Ticket

    contract Ticket::Contract::Base

    representer Ticket::Representer::Show

    def process(params)
      validate(params[:ticket]) do
        contract.save
      end
    end
  end
end
