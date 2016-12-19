class User
  class Show < Emilito::Operation::Present
    representer :render, User::Representer::Show

    def model!(options, params:, **)
      options['model'] = User.find_by(params.slice(:id))
    end
  end
end
