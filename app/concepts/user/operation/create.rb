class User
  class Create < Emilito::Operation::Create
    model User, :create

    contract User::Contract::Base do
      feature Reform::Form::Dry

      property :password
      property :password_confirmation

      validation do
        required(:email).filled(:str?)
        required(:password).filled(:str?)
      end
    end

    representer User::Representer::Show

    def process(params)
      validate(params[:user]) do
        contract.save
      end
    end
  end
end
