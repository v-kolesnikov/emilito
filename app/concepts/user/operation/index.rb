class User
  class Index < Emilito::Operation::Present
    include Trailblazer::Operation::Collection

    representer User::Representer::Index

    def model!(*)
      User.all
    end
  end
end
