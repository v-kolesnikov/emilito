class Webhook
  class Show < Emilito::Operation::Present
    model Webhook

    representer Webhook::Representer::Show
  end
end
