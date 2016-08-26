class Account
  class Create < Trailblazer::Operation
    include Model

    model Account, :create

    contract Account::Contract::Create

    def process(params)
      validate(params[:account]) do
        contract.save
      end
    end
  end
end
