class WebhookDelivery
  class Create < Emilito::Operation::Create
    model WebhookDelivery, :create

    contract WebhookDelivery::Contract::Create

    representer WebhookDelivery::Representer::Show

    def process(params)
      validate(params[:webhook_delivery]) do
        contract.save
        response = delivery!
        validate(response: response, delivered: true) do
          contract.save
        end
      end
    end

    def delivery!
      build_request!

      status, headers, body = WebhookService::HttpClient.call(
        model.webhook.url,
        model.request['payload'],
        headers: model.request['headers']
      )

      { status: status, headers: headers, body: body }
    end

    private

    def build_request!
      data = Workspace::Representer::Show.new(model.webhook.workspace).to_json
      headers = build_x_headers(data)

      validate(request: { headers: headers, payload: data }) do
        contract.sync
      end
    end

    def build_x_headers(request_body)
      model.request['headers'].dup.tap do |h|
        h['X-Emilito-Delivery'] = model.id
        h['X-Emilito-Event'] = 'create ticket'

        if model.webhook.secret
          sha1 = sha1_signature(model.webhook.secret, request_body)
          h['X-Emilito-Signature'] = "sha1=#{sha1}"
        end
      end
    end

    def sha1_signature(key, data)
      require 'openssl'
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), key, data)
    end
  end
end
