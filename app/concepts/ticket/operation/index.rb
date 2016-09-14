class Ticket
  class Index < Emilito::Operation::Present
    include Trailblazer::Operation::Collection

    representer Ticket::Representer::Index

    def model!(*)
      Ticket.all
    end
  end
end
