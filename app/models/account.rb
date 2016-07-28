class Account < ApplicationRecord
  has_secure_password
  has_many :workspaces
  has_many :tickets
end
