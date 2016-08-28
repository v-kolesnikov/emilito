module Web
  class SessionsController < Web::ApplicationController
    before_action :logged_in_behavior!, only: [:new, :create]

    def new
      form Session::SignIn
    end

    def create
      run Session::SignIn do |op|
        login(op.model)
        return redirect_to dashboard_path
      end

      render :new, status: :unauthorized
    end

    def destroy
      logout
      redirect_to :root
    end

    protected

    def logged_in_behavior!
      redirect_to dashboard_path if logged_in?
    end
  end
end
