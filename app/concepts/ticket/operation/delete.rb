class Ticket
  class Delete < Trailblazer::Operation
    include Model
    model Ticket, :find

    include Trailblazer::Operation::Responder

    def process(_params)
      model.destroy
    end
  end
end
