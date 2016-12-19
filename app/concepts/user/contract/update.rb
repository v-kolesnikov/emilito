class User
  module Contract
    class Update < User::Contract::Base
      feature Reform::Form::Dry

      validation do
        required(:email).filled(:str?)
      end
    end
  end
end
