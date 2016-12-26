class Ticket
  class Delete < Emilito::Operation::Delete
    step Model(Ticket, :find_by)
    step :destroy!
  end
end
