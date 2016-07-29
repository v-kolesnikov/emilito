require 'representable/json'

class Workspace
  module Representer
    class Show < Representable::Decorator
      include Representable::Hash
      include Representable::Hash::AllowSymbols
      include Representable::JSON

      property :id
      property :title
      property :created_at
      property :updated_at
    end
  end
end
