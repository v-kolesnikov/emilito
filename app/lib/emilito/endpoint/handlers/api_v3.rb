# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

module Emilito
  module Endpoint
    module Handlers
      # Generic matcher handlers for a Emilito API v3 backend.
      class ApiV3
        def initialize(controller, options)
          @controller = controller
          @path       = options[:path]
        end

        attr_reader :controller

        def call
          ->(m) do
            m.not_found { controller.head 404 }

            m.present do |result|
              output = result['representer.render.class'].new(result['model'])
              controller.render json: output, status: 200
            end

            m.created do |result|
              output = result['representer.render.class'].new(result['model'])
              controller.render json: output, status: 201
            end

            m.success do |result|
              if (representer = result['representer.render.class'])
                output = representer.new(result['model'])
                controller.render json: output, status: 200
              else
                controller.head :ok
              end
            end

            m.invalid do |result|
              representer = result['representer.errors.class']
              output = representer.new(result['result.contract.default'].errors)
              controller.render json: output, status: 422
            end
          end
        end
      end
    end
  end
end
