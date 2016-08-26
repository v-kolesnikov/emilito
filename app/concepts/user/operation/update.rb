class User
  class Update < User::Create
    model User, :update
    contract User::Contract::Update
  end
end
