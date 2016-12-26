class Workspace
  class Delete < Emilito::Operation::Delete
    step Model(Workspace, :find_by)
    step :destroy!
  end
end
