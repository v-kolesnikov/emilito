module Web
  class SessionsController < Web::ApplicationController
    before_action :logged_in_behavior!, only: [:new, :create]

    # GET /sign_in
    def new
      form Session::SignIn
    end

    # POST /sign_in
    def create
      run Session::SignIn do |op|
        login(op.model)
        return redirect_to dashboard_path
      end

      render :new, status: :unauthorized
    end

    # DELETE /sign_out
    def destroy
      logout
      redirect_to :root
    end
  end
end
