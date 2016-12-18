module Emilito
  module Operation
    class Delete < Emilito::Operation::Base
      step :model!
      step :destroy!

      def destroy!(options, **)
        options['model'].destroy
      end
    end
  end
end
