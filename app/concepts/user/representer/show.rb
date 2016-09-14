class User
  module Representer
    class Show < Emilito::Representer::Base
      property :id
      property :name
      property :email
      property :created_at
      property :updated_at
    end
  end
end
