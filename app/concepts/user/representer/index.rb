require 'representable/json'
require 'user/representer/show'

class User
  module Representer
    class Index < Representable::Decorator
      include Representable::JSON::Collection

      items class: User, decorator: User::Representer::Show
    end
  end
end
