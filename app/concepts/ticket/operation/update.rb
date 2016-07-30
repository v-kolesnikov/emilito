class Ticket
  class Update < Ticket::Create
    model Ticket, :update
  end
end
