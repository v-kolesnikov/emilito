class Webhook < ApplicationRecord
  belongs_to :workspace
  has_many :webhook_deliveries
  has_many :deliveries, class_name: WebhookDelivery
end
