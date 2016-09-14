class Ticket
  class Show < Emilito::Operation::Present
    model Ticket, :find
    representer Ticket::Representer::Show
  end
end
