class User
  class Create < Trailblazer::Operation
    include Model
    model User, :create

    contract User::Contract::Create

    extend  Trailblazer::Operation::Representer::DSL
    include Trailblazer::Operation::Representer::Rendering
    include Trailblazer::Operation::Responder

    representer User::Representer::Show

    def process(params)
      validate(params[:user]) do
        contract.save
      end
    end
  end
end
