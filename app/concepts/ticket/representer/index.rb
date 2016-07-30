require 'representable/json'
require 'ticket/representer/show'

class Ticket
  module Representer
    class Index < Representable::Decorator
      include Representable::JSON::Collection

      items class: Ticket, decorator: Ticket::Representer::Show
    end
  end
end
