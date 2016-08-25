require 'representable/json'

class User
  module Representer
    class Show < Representable::Decorator
      include Representable::Hash
      include Representable::Hash::AllowSymbols
      include Representable::JSON

      property :id
      property :name
      property :email
      property :created_at
      property :updated_at
    end
  end
end
