require 'trailblazer/operation/auto_inject'

module Emilito
  module Operation
    AutoInject = Trailblazer::Operation::AutoInject(Emilito::Container)
  end
end
