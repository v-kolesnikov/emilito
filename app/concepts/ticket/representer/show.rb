class Ticket
  module Representer
    class Show < Emilito::Representer::Base
      property :id
      property :title
      property :workspace_id
      property :created_at
      property :updated_at
    end
  end
end
