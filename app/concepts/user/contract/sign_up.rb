require 'uri'

class User
  module Contract
    class SignUp < User::Contract::Base
      feature Reform::Form::Dry

      EMAIL_REGEXP = URI::MailTo::EMAIL_REGEXP

      property :password
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
        required(:email) do
          filled? & str? & format?(EMAIL_REGEXP) & email_unique?
        end
        required(:password).filled(min_size?: 6)
      end
    end
  end
end
