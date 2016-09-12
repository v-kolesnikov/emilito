class Ticket
  class Delete < Emilito::Operation::Delete
    model Ticket, :find
  end
end
