class Workspace
  class Update < Workspace::Create
    representer :render, Representer::Show

    def model!(options, params:, **)
      options['model'] = Workspace.find_by(params.slice(:id))
    end
  end
end
