require 'workspace/operation/show'

class Workspace
  class Delete < Workspace::Show
    def process(params)
      validate(params) do
        model.destroy
      end
    end
  end
end
