require 'workspace/representer/show'

class Workspace
  module Representer
    class Index < Emilito::Representer::Collection
      items class: Workspace, decorator: Workspace::Representer::Show
    end
  end
end
