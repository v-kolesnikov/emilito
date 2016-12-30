class Workspace < ApplicationRecord
  belongs_to :account
  has_many :tickets, dependent: :destroy
end
