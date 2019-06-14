# frozen_string_literal: true

require 'rails/generators/base'

module Heartlike
  module Generators
    class ControllersGenerator < Rails::Generators::Base
      argument :name, desc: 'Name of parent model', required: true


      source_root File.expand_path("../../templates/controllers", __FILE__)
      argument :scope, required: true,
               desc: "The scope to create controllers in, e.g. users, admins"

      def create_controllers
        @scope_prefix = scope.blank? ? '' : (scope.camelize + '::')
        @parent = name.pluralize

        template "heartlikes_controller.rb", "app/controllers/#{scope}/#{name.downcase.pluralize}_controller.rb"

      end

    end
  end
end