class Ticket
  class Index < Trailblazer::Operation
    include Trailblazer::Operation::Collection

    extend  Trailblazer::Operation::Representer::DSL
    include Trailblazer::Operation::Representer::Rendering
    include Trailblazer::Operation::Responder

    representer Ticket::Representer::Index

    def model!(params)
      limit  = params[:limit] || 10
      page   = params[:page]  || 1
      offset = limit * (page.to_i - 1)

      workspace = Workspace.find(params[:workspace_id])
      workspace.tickets.limit(limit).offset(offset)
    end

    def process(*)
    end
  end
end
