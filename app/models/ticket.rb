class Ticket < ApplicationRecord
  belongs_to :workspace
  belongs_to :account
end
