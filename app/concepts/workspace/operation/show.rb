class Workspace
  class Show < Trailblazer::Operation
    include Model
    model Workspace, :find

    extend  Trailblazer::Operation::Representer::DSL
    include Trailblazer::Operation::Representer::Rendering
    include Trailblazer::Operation::Responder

    representer Representer::Show

    def process(_params)
    end
  end
end
