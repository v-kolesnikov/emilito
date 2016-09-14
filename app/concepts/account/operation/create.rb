class Account
  class Create < Emilito::Operation::Create
    model Account, :create

    contract Account::Contract::Create

    def process(params)
      validate(params[:account]) do
        contract.save
      end
    end
  end
end
