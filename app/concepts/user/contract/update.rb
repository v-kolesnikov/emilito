class User
  module Contract
    class Update < Base
      feature Reform::Form::Dry

      validation do
        required(:email).filled(:str?)
      end
    end
  end
end
