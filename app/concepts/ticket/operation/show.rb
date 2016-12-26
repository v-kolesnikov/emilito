class Ticket
  class Show < Emilito::Operation::Present
    step Model(Ticket, :find_by)
    representer :render, Ticket::Representer::Show
  end
end
