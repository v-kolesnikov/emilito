class User
  class Show < Trailblazer::Operation
    include Model
    model User, :find

    extend  Trailblazer::Operation::Representer::DSL
    include Trailblazer::Operation::Representer::Rendering
    include Trailblazer::Operation::Responder

    representer User::Representer::Show

    def process(_params)
    end
  end
end
