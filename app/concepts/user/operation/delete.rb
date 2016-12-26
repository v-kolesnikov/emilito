class User
  class Delete < Emilito::Operation::Delete
    step Model(User, :find_by)
    step :destroy!
  end
end
