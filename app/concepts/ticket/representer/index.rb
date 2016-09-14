require 'ticket/representer/show'

class Ticket
  module Representer
    class Index < Emilito::Representer::Collection
      items class: Ticket, decorator: Ticket::Representer::Show
    end
  end
end
