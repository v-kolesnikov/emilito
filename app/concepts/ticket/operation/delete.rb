class Ticket
  class Delete < Trailblazer::Operation
    include Model
    model Ticket, :find

    include Trailblazer::Operation::Responder

    def process(params)
      validate(params) do
        model.destroy
      end
    end
  end
end
