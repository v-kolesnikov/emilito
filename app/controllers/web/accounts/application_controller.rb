module Web
  module Accounts
    class ApplicationController < Web::ApplicationController
      before_action :authorize!
    end
  end
end
