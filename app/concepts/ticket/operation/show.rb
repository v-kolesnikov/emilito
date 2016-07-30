class Ticket
  class Show < Trailblazer::Operation
    include Model
    model Ticket, :find

    extend  Trailblazer::Operation::Representer::DSL
    include Trailblazer::Operation::Representer::Rendering
    include Trailblazer::Operation::Responder

    representer Ticket::Representer::Show

    def process(*)
    end
  end
end
