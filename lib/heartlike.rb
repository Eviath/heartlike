require "heartlike/engine"
require 'rails'
require 'active_support/dependencies'
require 'orm_adapter'
require 'securerandom'

# Heartlike admin
require 'heartlike/admin/resources/resources'
require 'heartlike/admin/resource'
require 'heartlike/admin/dashboard'

module Heartlike
  # Your code goes here...
  #
  module Controllers
    autoload :Hearts, 'devise/controllers/hearts'
  end

end
