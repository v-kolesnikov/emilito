module Web
  class SessionsController < Web::ApplicationController
    before_action :logged_in_behavior!, only: [:new, :create]

    # GET /sign_in
    def new
      run Session::SignIn
    end

    # POST /sign_in
    def create
      endpoint Session::SignIn, args: [params] do |m|
        m.success do |result|
          login(result['model'])
          redirect_to dashboard_path
        end

        m.invalid do |result|
          @form = result['contract.default']
          render :new, status: :unauthorized
        end
      end
    end

    # DELETE /sign_out
    def destroy
      logout
      redirect_to :root
    end
  end
end
