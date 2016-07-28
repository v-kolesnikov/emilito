class User < ApplicationRecord
  belongs_to :account
  has_secure_password
end
