class Workspace
  module Representer
    class Show < Emilito::Representer::Base
      property :id
      property :title
      property :created_at
      property :updated_at
    end
  end
end
