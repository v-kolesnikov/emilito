module Emilito
  module Operation
    class Delete < Emilito::Operation::Base
      include Model

      def process(*)
        model.destroy
      end
    end
  end
end
