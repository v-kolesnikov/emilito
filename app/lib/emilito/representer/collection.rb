require 'representable/json'

module Emilito
  module Representer
    class Collection < Base
      include Representable::JSON::Collection
    end
  end
end
