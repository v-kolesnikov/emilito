class User
  class Delete < Emilito::Operation::Delete
    model User, :find
  end
end
