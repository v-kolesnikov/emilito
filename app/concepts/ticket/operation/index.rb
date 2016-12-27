class Ticket
  class Index < Emilito::Operation::PresentCollection
    representer :render, Ticket::Representer::Index

    def model!(options, params:, **)
      options['model'] = Ticket.where(params.slice(:workspace_id))
    end
  end
end
