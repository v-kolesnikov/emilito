# TODO: This is monkey patch!
# Remove it after follow bug will be fixed in trailblazer-rails:
# https://github.com/trailblazer/trailblazer-rails/issues/28

module Trailblazer::Operation::Responder
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def model_name
      model_class.model_name
    end
  end

  extend Forwardable
  def_delegators :@model, :to_param, :destroyed?, :persisted?

  def errors
    @valid ? [] : contract.errors
  end

  def to_model
    @model
  end
end
