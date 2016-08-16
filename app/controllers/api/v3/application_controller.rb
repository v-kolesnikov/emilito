module Api
  module V3
    class ApplicationController < ::Api::ApplicationController
      include ActionController::MimeResponds
      include Trailblazer::Operation::Controller

      respond_to :json

      before_action :doorkeeper_authorize!
    end
  end
end
