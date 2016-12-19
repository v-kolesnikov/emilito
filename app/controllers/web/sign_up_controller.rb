module Web
  class SignUpController < Web::ApplicationController
    before_action :logged_in_behavior!

    # GET /sign_up
    def new
      run User::SignUp
    end

    # POST /sign_up
    def create
      endpoint User::SignUp, args: [params] do |m|
        m.success do |result|
          login(result['model'])
          redirect_to dashboard_path
        end

        m.invalid do |result|
          @form = result['contract.default']
          render :new, status: :unprocessable_entity
        end
      end
    end
  end
end
