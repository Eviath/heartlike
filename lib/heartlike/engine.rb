require 'devise'
require 'font-awesome-sass'
require 'bootstrap'
module Heartlike
  class Engine < ::Rails::Engine
    isolate_namespace Heartlike

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end

    initializer "heartlike.factories", after: "factory_bot.set_factory_paths" do
      FactoryBot.definition_file_paths << File.expand_path('../../../spec/factories', __FILE__) if defined?(FactoryBot)
    end
  end
end
