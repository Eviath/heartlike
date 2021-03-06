$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "heartlike/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "heartlike"
  spec.version     = Heartlike::VERSION
  spec.authors     = ["Jacek Kowalski"]
  spec.email       = ["eviathos@gmail.com"]
  spec.homepage    = "https://github.com/Eviath/heartlike"
  spec.summary     = "Heartlike Ruby on Rails Engine"
  spec.description = "Heartlike adds 'hearts' or 'likes' system to any ruby on rails application. You can add likes to anything in your application!"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.add_dependency("orm_adapter", "~> 0.1")
  spec.add_dependency "rails", "~> 6.0.0.rc1"
  spec.add_dependency 'devise'
  spec.add_dependency 'bootstrap', '~> 4.3.1'
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency "better_errors"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "binding_of_caller"
  spec.add_dependency 'font-awesome-sass', '5.8.1'
  spec.add_dependency 'activestorage'
  spec.add_dependency 'sass-rails', ['>= 4.0', '< 7']
  spec.add_dependency 'jquery-rails', ['>= 3.0', '< 5']
  spec.add_development_dependency "pry"
end
