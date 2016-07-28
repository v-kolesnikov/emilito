class Workspace
  module Contract
    class Base < Reform::Form
      property :account_id, type: Integer
      property :title, type: String
    end
  end
end
