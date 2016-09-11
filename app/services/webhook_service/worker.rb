module WebhookService
  class Worker
    include Sidekiq::Worker

    def perform(event)
      webhooks = Webhook.subscribed(event)
      webhooks.each do |hook|
        WebhookDelivery::Create.(webhook_delivery: { webhook_id: hook.id })
      end
    end
  end
end
