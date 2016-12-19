module Emilito
  module Operation
    class Create < Emilito::Operation::Base
      step :model!
      step Contract::Build()
      step :extract_params!
      step Contract::Validate(skip_extract: true)
      step Contract::Persist()

      def extract_params!(options, **)
        options['contract.default.params'] = options['params'][type]
      end
    end
  end
end
