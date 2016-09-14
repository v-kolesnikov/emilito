require 'user/representer/show'

class User
  module Representer
    class Index < Emilito::Representer::Collection
      items class: User, decorator: User::Representer::Show
    end
  end
end
