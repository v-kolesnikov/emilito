class Ticket
  class Delete < Emilito::Operation::Delete
    def model!(options, params:, **)
      options['model'] = Ticket.find_by(params.slice(:id))
    end
  end
end
