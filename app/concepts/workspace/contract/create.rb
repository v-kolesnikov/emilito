class Workspace
  module Contract
    class Create < Workspace::Contract::Base
      feature Reform::Form::Dry
      validation do
        required(:account_id).filled(:int?)
        required(:title).filled(:str?)
      end
    end
  end
end
