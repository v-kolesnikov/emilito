class Webhook < ApplicationRecord
  belongs_to :workspace
  has_many :webhook_deliveries
  has_many :deliveries, class_name: WebhookDelivery

  scope :subscribed, -> (args) { where('events @> ARRAY[?]::varchar[]', args) }
end
