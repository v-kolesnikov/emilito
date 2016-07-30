module Api
  class ErrorsController < Api::ApplicationController
    def not_found
      render json: { message: 'Not Found' },
             status: :not_found
    end

    def not_acceptable
      render json: { message: 'Not Acceptable' },
             status: :not_acceptable
    end

    def internal_server_error
      render json: { message: 'Internal Server Error' },
             status: :internal_server_error
    end
  end
end
