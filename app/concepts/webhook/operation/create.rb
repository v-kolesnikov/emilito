class Webhook
  class Create < Emilito::Operation::Create
    model Webhook, :create

    contract Webhook::Contract::Base do
      feature Reform::Form::Dry

      property :events, default: -> { ['create'] }
      property :active, default: -> { true }

      validation do
        required(:workspace_id).filled

        required(:name).filled(:str?)
        required(:url).filled(:str?)

        required(:events).each(:str?)
        required(:active).filled(:bool?)

        optional(:ping_url).filled(:str?)
        optional(:test_url).filled(:str?)
        optional(:secret).filled(:str?)
      end
    end

    representer Webhook::Representer::Show

    def process(params)
      validate(params[:webhook]) do
        contract.save
      end
    end
  end
end
