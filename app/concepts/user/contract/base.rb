class User
  module Contract
    class Base < Reform::Form
      property :login
      property :email
    end
  end
end
