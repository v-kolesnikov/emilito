class Workspace
  class Delete < Emilito::Operation::Delete
    model Workspace, :find
  end
end
