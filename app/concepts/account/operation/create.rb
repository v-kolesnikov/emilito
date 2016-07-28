class Account
  class Create < Trailblazer::Operation
    include Model

    model Account, :create

    contract Account::Contract::Base

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end
