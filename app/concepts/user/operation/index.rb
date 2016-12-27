class User
  class Index < Emilito::Operation::PresentCollection
    representer :render, User::Representer::Index

    def model!(options, **)
      options['model'] = User.all
    end
  end
end
