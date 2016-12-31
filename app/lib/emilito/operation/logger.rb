require 'colorized_string'

module Emilito
  module Operation
    module Logger
      def self.included(base)
        base.send :include, AutoInject['logger']
        base.send :include, Methods
      end

      module Methods
        def operation_call_log(options, params:, **)
          msg = "Operation: #{self.class}.(#{params.inspect})"
          colorized_msg = ColorizedString.new(msg).light_yellow
          options[:logger].info(colorized_msg)
        end
      end
    end
  end
end
