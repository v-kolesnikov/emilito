class User
  module Contract
    class SignUp < Base
      feature Reform::Form::Dry

      property :password
      property :password_confirmation

      property :account, default: -> { Account.new }

      validation do
        configure do
          def login_unique?(value)
            !User.where(login: value).exists?
          end

          def email_unique?(value)
            !User.where(email: value).exists?
          end

          config.messages_file =
            'app/concepts/user/operation/error_messages/sign_up.yml'
        end

        required(:login).filled(:str?, :login_unique?)
        required(:email).filled(:str?, :email_unique?)
        required(:password).filled(min_size?: 6)
      end
    end
  end
end
