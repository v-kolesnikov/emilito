class Account < ApplicationRecord
  has_one :user
  has_one :owner, class_name: 'User' # Alias for user

  has_many :workspaces, dependent: :destroy
  has_many :tickets
end
