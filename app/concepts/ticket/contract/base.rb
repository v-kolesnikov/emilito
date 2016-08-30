class Ticket
  module Contract
    class Base < Reform::Form
      feature Reform::Form::Dry

      property :title, type: String
      property :workspace_id, type: Integer

      validation do
        required(:title).filled
        required(:workspace_id).filled
      end
    end
  end
end
