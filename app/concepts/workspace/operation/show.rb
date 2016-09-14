class Workspace
  class Show < Emilito::Operation::Present
    model Workspace, :find
    representer Representer::Show
  end
end
