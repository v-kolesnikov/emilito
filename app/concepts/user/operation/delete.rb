class User
  class Delete < Trailblazer::Operation
    include Trailblazer::Operation::Responder

    include Model
    model User, :find

    def process(_params)
      model.destroy
    end
  end
end
