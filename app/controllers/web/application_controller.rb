module Web
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    include Trailblazer::Operation::Controller

    def authorize!
      redirect_to sign_in_path unless logged_in?
    end

    module SessionMixin
      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end

      def login(user)
        session[:user_id] = user.id
      end

      def logged_in?
        !current_user.nil?
      end

      def logout
        session[:user_id] = nil
        @current_user = nil
      end
    end
    include SessionMixin
  end
end
