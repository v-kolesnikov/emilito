Session = Struct.new(:email, :password)

class Session
  class SignIn < Emilito::Operation::Base
    contract do
      feature Reform::Form::Dry

      undef :persisted?

      property :email
      property :password

      validation :default do
        configure do
          def password_ok?(email, password)
            user = User.find_by(email: email)
            user && user.authenticate(password)
          end
          config.messages_file =
            'app/concepts/session/operation/error_messages.yml'
        end

        required(:email).filled(:str?)
        required(:password).filled(:str?)

        rule(user_exists: [:email, :password]) do |email, password|
          password.password_ok?(email)
        end
      end
    end

    def process(params)
      validate(params[:session]) do
        self.model = User.find_by(email: contract.email)
      end
    end

    private

    def model!(_)
      Session.new
    end
  end
end
