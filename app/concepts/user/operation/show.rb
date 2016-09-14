class User
  class Show < Emilito::Operation::Present
    model User, :find
    representer User::Representer::Show
  end
end
