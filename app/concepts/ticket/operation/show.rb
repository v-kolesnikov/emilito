class Ticket
  class Show < Emilito::Operation::Present
    representer :render, Ticket::Representer::Show

    def model!(options, params:, **)
      options['model'] = Ticket.find_by(params.slice(:workspace_id, :id))
    end
  end
end
