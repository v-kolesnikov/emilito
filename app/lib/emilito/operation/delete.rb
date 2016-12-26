module Emilito
  module Operation
    class Delete < Emilito::Operation::Base
      def destroy!(options, **)
        options['model'].destroy
      end
    end
  end
end
