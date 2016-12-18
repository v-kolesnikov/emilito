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

        rule(password: [:email, :password]) do |email, password|
          password.password_ok?(email)
        end
      end
    end

    step :model!
    step Contract::Build()
    step :extract_params!
    step Contract::Validate(skip_extract: true)
    step :set_user!

    def extract_params!(options, **)
      options['contract.default.params'] = options['params'][:session]
    end

    def model!(options, **)
      options['model'] = Session.new
    end

    def set_user!(options, params:, **)
      options['model'] = User.find_by(email: params.dig(:session, :email))
    end
  end
end
