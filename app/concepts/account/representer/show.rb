require 'representable/json'

class Account
  module Representer
    class Show < Representable::Decorator
      include Representable::Hash
      include Representable::Hash::AllowSymbols
      include Representable::JSON

      property :id
      property :user, decorator: User::Representer::Show
    end
  end
end
