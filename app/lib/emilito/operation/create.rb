module Emilito
  module Operation
    class Create < Emilito::Operation::Present
      include Trailblazer::Operation::Responder
    end
  end
end
