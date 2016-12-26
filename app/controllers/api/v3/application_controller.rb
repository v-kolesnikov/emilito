module Api
  module V3
    class ApplicationController < ActionController::API
      include ActionController::MimeResponds
      include Emilito::Endpoint::Controller

      respond_to :json

      def handlers(options = {})
        Emilito::Endpoint::Handlers::ApiV3.new(self, options).()
      end

      def params
        request.parameters
      end
    end
  end
end
