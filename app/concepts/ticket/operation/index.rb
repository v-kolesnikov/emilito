class Ticket
  class Index < Emilito::Operation::Present
    representer :render, Ticket::Representer::Index

    def model!(options, **)
      options['model'] = Ticket.where(params.slice(:account_id, :workspace_id))
    end
  end
end
