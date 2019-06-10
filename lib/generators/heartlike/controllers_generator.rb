# frozen_string_literal: true

require 'rails/generators/base'

module Heartlike
  module Generators
    class ControllersGenerator < Rails::Generators::Base
      CONTROLLERS = %w(heart).freeze

      #  For example:
      #    rails generate heartlike:controllers users -c=sessions
      #  This will create a controller class at app/controllers/users/sessions_controller.rb like this:
      #     class Users::SessionsController < Devise::SessionsController
      #         content...
      #     end


      source_root File.expand_path("../../templates/controllers", __FILE__)
      argument :scope, required: true,
               desc: "The scope to create controllers in, e.g. users, admins"
      class_option :controllers, aliases: "-c", type: :array,
                   desc: "Select specific controllers to generate (#{CONTROLLERS.join(', ')})"

      def create_controllers
        @scope_prefix = scope.blank? ? '' : (scope.camelize + '::')
        controllers = options[:controllers] || CONTROLLERS
        controllers.each do |name|
          template "#{name}_controller.rb",
                   "app/controllers/#{scope}/#{name}_controller.rb"
        end
      end

    end
  end
end