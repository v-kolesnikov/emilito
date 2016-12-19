class Ticket
  class Update < Ticket::Create
    def model!(options, params:, **)
      options['model'] = Ticket.find_by(params.slice(:workspace_id, :id))
    end
  end
end
