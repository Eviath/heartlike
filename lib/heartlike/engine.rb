require 'devise'
require 'font-awesome-sass'
require 'bootstrap'
module Heartlike
  class Engine < ::Rails::Engine
    isolate_namespace Heartlike

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
