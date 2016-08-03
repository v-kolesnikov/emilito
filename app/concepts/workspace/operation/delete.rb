class Workspace
  class Delete < Trailblazer::Operation
    include Trailblazer::Operation::Responder

    include Model
    model Workspace, :find

    contract do
      property :id
    end

    def process(params)
      validate(params) do
        model.destroy
      end
    end
  end
end
