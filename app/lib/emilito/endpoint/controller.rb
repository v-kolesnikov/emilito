module Emilito
  module Endpoint
    module Controller
      def endpoint(operation_class, options = endpoint_options, &block)
        Trailblazer::Endpoint.(
          operation_class,
          handlers(options),
          *options[:args],
          &block
        )
      end

      def endpoint_options
        { args: [params] }
      end

      def handlers(options = {})
        Handlers::Rails.new(self, options).()
      end
    end
  end
end
