class Ticket
  class Create < Trailblazer::Operation
    include Model
    model Ticket, :create

    contract Ticket::Contract::Base

    extend  Trailblazer::Operation::Representer::DSL
    include Trailblazer::Operation::Representer::Rendering
    include Trailblazer::Operation::Responder

    representer Ticket::Representer::Show

    def process(params)
      validate(params[:ticket]) do
        contract.save
      end
    end
  end
end
