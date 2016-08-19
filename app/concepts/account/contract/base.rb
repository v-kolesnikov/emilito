class Account
  module Contract
    class Base < Reform::Form
      property :email
      property :password
    end
  end
end
