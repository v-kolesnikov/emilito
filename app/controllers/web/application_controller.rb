module Web
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?

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

    protected

    def logged_in_behavior!
      redirect_to dashboard_path if logged_in?
    end
  end
end
