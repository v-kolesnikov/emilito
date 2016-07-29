module Api
  module V3
    class ApplicationController < ::Api::ApplicationController
      include ActionController::MimeResponds
      include Trailblazer::Operation::Controller
      respond_to :json
    end
  end
end
