class Workspace
  class Create < Emilito::Operation::Create
    contract Workspace::Contract::Create

    representer :render, Workspace::Representer::Show

    def model!(options, **)
      options['model'] = Workspace.new
    end

    def type
      :workspace
    end
  end
end
