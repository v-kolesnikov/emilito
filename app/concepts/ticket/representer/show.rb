require 'representable/json'

class Ticket
  module Representer
    class Show < Representable::Decorator
      include Representable::Hash
      include Representable::Hash::AllowSymbols
      include Representable::JSON

      property :id
      property :title
      property :account_id
      property :workspace_id
      property :created_at
      property :updated_at
    end
  end
end
