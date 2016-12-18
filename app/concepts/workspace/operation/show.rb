class Workspace
  class Show < Emilito::Operation::Present
    representer :render, Representer::Show

    def model!(options, params:, **)
      options['model'] = Workspace.find_by(params.slice(:id))
    end
  end
end
