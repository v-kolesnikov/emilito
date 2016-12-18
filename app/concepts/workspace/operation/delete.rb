class Workspace
  class Delete < Emilito::Operation::Delete
    def model!(options, params:, **)
      options['model'] = Workspace.find_by(params.slice(:id))
    end
  end
end
