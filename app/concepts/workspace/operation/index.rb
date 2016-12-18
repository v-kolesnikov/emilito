class Workspace
  class Index < Emilito::Operation::Present
    representer :render, Workspace::Representer::Index

    def model!(options, params:, **)
      options['model'] = Workspace.where(params.slice(:account_id))
    end
  end
end
