require 'representable/json'

module Emilito
  module Representer
    class Base < Representable::Decorator
      include Representable::Hash
      include Representable::Hash::AllowSymbols
      include Representable::JSON
    end
  end
end
