module Web
  class SignUpController < Web::ApplicationController
    before_action :logged_in_behavior!

    # GET /sign_up
    def new
      form User::SignUp
    end

    # POST /sign_up
    def create
      run User::SignUp do |op|
        login(op.model)
        return redirect_to dashboard_path
      end

      render :new, status: :unprocessable_entity
    end
  end
end
