class User
  class Index < Trailblazer::Operation
    include Trailblazer::Operation::Collection

    extend  Trailblazer::Operation::Representer::DSL
    include Trailblazer::Operation::Representer::Rendering
    include Trailblazer::Operation::Responder

    representer User::Representer::Index

    def model!(_params)
      User.limit(100)
    end

    def process(_params)
    end
  end
end
