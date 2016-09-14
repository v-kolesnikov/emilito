class Account
  module Representer
    class Show < Emilito::Representer::Base
      property :id
      property :user, decorator: User::Representer::Show
    end
  end
end
