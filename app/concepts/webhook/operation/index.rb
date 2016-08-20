class Webhook
  class Index < Emilito::Operation::Present
    include Trailblazer::Operation::Collection

    representer do
      include Representable::JSON::Collection
      items class: ::Webhook, decorator: Webhook::Representer::Show
    end
  end
end
