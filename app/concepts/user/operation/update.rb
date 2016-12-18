class User
  class Update < User::Create
    contract User::Contract::Update

    def model!(options, params:, **)
      options['model'] = User.find_by(id: params[:id])
    end
  end
end
