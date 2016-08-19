module Web
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    include Trailblazer::Operation::Controller

    def current_user
      # TODO: This is hardcode for testing OAuth
      Account.first
    end
  end
end
