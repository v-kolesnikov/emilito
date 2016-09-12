class Workspace
  class Index < Emilito::Operation::Present
    include Trailblazer::Operation::Collection

    representer Workspace::Representer::Index

    def model!(*)
      Workspace.all
    end
  end
end
