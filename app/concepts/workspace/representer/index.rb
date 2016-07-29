require 'representable/json'
require 'workspace/representer/show'

class Workspace
  module Representer
    class Index < Representable::Decorator
      include Representable::JSON::Collection

      items class: Workspace, decorator: Workspace::Representer::Show
    end
  end
end
