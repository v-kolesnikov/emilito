require 'reform/form/dry'

class Account
  class Create < Trailblazer::Operation
    include Model

    model Account, :create

    contract Account::Contract::Base do
      feature Reform::Form::Dry

      validation do
        required(:email).filled(:str?)
        required(:password).filled(:str?)
      end
    end

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end
