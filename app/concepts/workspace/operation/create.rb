class Workspace
  class Create < Emilito::Operation::Create
    model Workspace, :create

    contract Workspace::Contract::Create

    representer Workspace::Representer::Show

    def process(params)
      validate(params[:workspace]) do
        contract.save
      end
    end
  end
end
