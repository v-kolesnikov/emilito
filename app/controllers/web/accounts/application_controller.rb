module Web
  module Accounts
    class ApplicationController < Web::ApplicationController
      before_action :authorize!

      def authorize!
        redirect_to sign_in_path unless logged_in?
      end
    end
  end
end
