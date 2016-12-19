class User
  class Create < Emilito::Operation::Create
    contract User::Contract::Base do
      feature Reform::Form::Dry

      property :password
      property :password_confirmation

      validation do
        required(:email).filled(:str?)
        required(:password).filled(:str?)
      end
    end

    representer :render, User::Representer::Show

    def model!(options, **)
      options['model'] = User.new
    end

    def type
      :user
    end
  end
end
