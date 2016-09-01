class User
  module Contract
    # Private API
    # See User::Contract::SignUp
    class Create < Base
      feature Reform::Form::Dry

      property :password
      property :password_confirmation

      validation do
        required(:email).filled(:str?)
        required(:password).filled(:str?)
      end
    end
  end
end
