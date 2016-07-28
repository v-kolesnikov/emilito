class Workspace
  class Create < Trailblazer::Operation
    include Model

    model Workspace, :create

    contract Workspace::Contract::Base

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end
