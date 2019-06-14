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

end
