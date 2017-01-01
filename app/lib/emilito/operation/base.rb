module Emilito
  module Operation
    class Base < Trailblazer::Operation
      extend Trailblazer::Operation::Contract::DSL
      extend Trailblazer::Operation::Representer::DSL

      include Emilito::Operation::Logger
      success :operation_call_log

      representer :errors, Emilito::Representer::Errors
    end
  end
end
