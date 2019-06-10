require "heartlike/engine"
require 'rails'
require 'active_support/dependencies'
require 'orm_adapter'
require 'securerandom'


module Heartlike
  # Your code goes here...
  #
  module Controllers
    autoload :Hearts, 'devise/controllers/hearts'
  end

  # Default way to set up Heartlike. Run rails generate heartlike_install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

  class Getter
    def initialize(name)
      @name = name
    end

    def get
      ActiveSupport::Dependencies.constantize(@name)
    end
  end

  def self.ref(arg)
    ActiveSupport::Dependencies.reference(arg)
    Getter.new(arg)
  end

  def self.available_router_name
    router_name || :main_app
  end

end
