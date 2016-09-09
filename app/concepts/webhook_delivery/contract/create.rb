require 'disposable/twin/property/hash'

class WebhookDelivery
  module Contract
    class Create < Reform::Form
      feature Reform::Form::Dry
      include Disposable::Twin::Property::Hash

      property :webhook_id
      property :delivered, default: -> { false }

      property :request, field: :hash do
        property :headers, default: {
          'Content-Type' => 'application/json',
          'User-Agent' => 'Emilito-Hookshot'
        }
        property :payload, default: -> { '' }
      end

      property :response, field: :hash do
        property :status
        property :headers
        property :body
      end

      validation do
        required(:webhook_id).filled
        required(:delivered).filled(:bool?)
        required(:request).schema do
          required(:headers).schema do
            required('Content-Type').filled(:str?)
            required('User-Agent').filled(:str?)
            optional('X-Emilito-Event').filled(:str?)
            optional('X-Emilito-Delivery').filled(:str?)
            optional('X-Emilito-Signature').filled(:str?)
          end
          required(:payload).value(:str?)
        end
      end
    end
  end
end
