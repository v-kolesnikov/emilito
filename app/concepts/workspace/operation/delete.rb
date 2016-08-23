class Workspace
  class Delete < Trailblazer::Operation
    include Trailblazer::Operation::Responder

    include Model
    model Workspace, :find

    contract do
      property :id
    end

    def process(_params)
      model.destroy
    end
  end
end
