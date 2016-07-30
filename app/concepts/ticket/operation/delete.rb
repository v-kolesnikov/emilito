require 'ticket/operation/show'

class Ticket
  class Delete < Ticket::Show
    def process(params)
      validate(params) do
        model.destroy
      end
    end
  end
end
