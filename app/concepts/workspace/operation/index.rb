class Workspace
  class Index < Emilito::Operation::PresentCollection
    representer :render, Workspace::Representer::Index

    def model!(options, params:, **)
      options['model'] = Workspace.where(params.slice(:account_id))
    end
  end
end
