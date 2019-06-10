# frozen_string_literal: true

require 'rails/generators/named_base'

module Heartlike
  module Generators
    class HeartlikeGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "heartlike"
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a model with the given NAME (if one does not exist) with heartlike " \
           "configuration plus a migration file and devise routes."

      class_option :routes, desc: "Generate routes", type: :boolean, default: true

      def add_heartlike_routes
        heartlike_route = "mount Heartlike::Engine => '/heartlike'".dup
        route heartlike_route
      end
    end
  end
end