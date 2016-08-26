require 'reform/form/dry'

class Account
  module Contract
    class Create < Base
      feature Reform::Form::Dry

      property :user, form: User::Contract::Create,
                      populate_if_empty: User

      validation do
        required(:user).filled(:hash?)
      end
    end
  end
end
