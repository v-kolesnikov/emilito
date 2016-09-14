module Emilito
  module Operation
    class Present < Emilito::Operation::Base
      include Model

      extend  Trailblazer::Operation::Representer::DSL
      include Trailblazer::Operation::Representer::Rendering
    end
  end
end
