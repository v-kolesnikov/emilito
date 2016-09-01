module Web
  class SignUpController < Web::ApplicationController
    before_action :logged_in_behavior!

    def new
      form User::SignUp
    end

    def create
      run User::SignUp do |op|
        login(op.model)
        return redirect_to dashboard_path
      end

      render :new, status: :unprocessable_entity
    end
  end
end
