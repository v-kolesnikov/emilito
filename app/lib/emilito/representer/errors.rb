module Emilito
  module Representer
    class Errors < Emilito::Representer::Base
      collection :messages, as: :errors
    end
  end
end
