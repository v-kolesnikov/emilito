require 'representable/json'

class Account
  module Representer
    class Show < Representable::Decorator
      include Representable::Hash
      include Representable::Hash::AllowSymbols
      include Representable::JSON

      property :id
      property :email
    end
  end
end
