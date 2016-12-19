class Account
  class Create < Emilito::Operation::Create
    contract Account::Contract::Create

    def model!(options, **)
      options['model'] = Account.new
    end

    def type
      :account
    end
  end
end
