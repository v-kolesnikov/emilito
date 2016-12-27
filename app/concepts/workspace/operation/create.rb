class Workspace
  class Create < Emilito::Operation::Create
    contract Workspace::Contract::Create

    representer :render, Workspace::Representer::Show

    def model!(options, params:, **)
      options['model'] = Workspace.new(params.slice(:account_id))
    end

    def type
      :workspace
    end
  end
end
