module Emilito
  class Container
    extend Dry::Container::Mixin

    register 'logger' do
      Rails.logger
    end
  end

  Import = Dry::AutoInject Container
end
