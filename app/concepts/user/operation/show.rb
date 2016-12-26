class User
  class Show < Emilito::Operation::Present
    step Model(User, :find_by)
    representer :render, User::Representer::Show
  end
end
