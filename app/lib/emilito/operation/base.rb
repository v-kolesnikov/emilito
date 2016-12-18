module Emilito
  module Operation
    class Base < Trailblazer::Operation
      extend Trailblazer::Operation::Contract::DSL
      extend Trailblazer::Operation::Representer::DSL
    end
  end
end
