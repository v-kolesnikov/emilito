class Account
  module Contract
    class Base < Reform::Form
      property :email, type: String
      property :password, type: String
    end
  end
end
