module Web
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    include Trailblazer::Operation::Controller
  end
end
