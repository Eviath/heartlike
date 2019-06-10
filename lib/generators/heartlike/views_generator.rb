# frozen_string_literal: true

require 'rails/generators/base'

module Heartlike
  module Generators
    # Include this module in your generator to generate Devise views.
    # `copy_views` is the main method and by default copies all views
    # with forms.
    module ViewPathTemplates #:nodoc:
      extend ActiveSupport::Concern

      included do
        argument :scope, required: false, default: nil,
                 desc: "The scope to copy views to"

        # Le sigh, ensure Thor won't handle opts as args
        # It should be fixed in future Rails releases
        class_option :views, aliases: "-v", type: :array, desc: "Select specific view directories to generate (hearts)"

        public_task :copy_views
      end

      def copy_views
        if options[:views]
          options[:views].each do |directory|
            view_directory directory.to_sym
          end
        else
          view_directory :hearts
        end
      end

      protected

      def view_directory(name, _target_path = nil)
        directory name.to_s, _target_path || "#{target_path}/#{name}" do |content|
          if scope
            content.gsub "heartlike/shared/links", "#{plural_scope}/shared/links"
          else
            content
          end
        end
      end

      def target_path
        @target_path ||= "app/views/#{plural_scope || :heartlike}"
      end

      def plural_scope
        @plural_scope ||= scope.presence && scope.underscore.pluralize
      end
    end

    class HeartsViewsGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../../../app/views/heartlike", __FILE__)
      desc "Copies shared Heartlike views to your application."
      hide!

      # Override copy_views to just copy mailer and shared.
      def copy_views
        view_directory :hearts
      end
    end

    class FormForGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../../../app/views/heartlike", __FILE__)
      desc "Copies default Heartlike views to your application."
      hide!
    end

    class ViewsGenerator < Rails::Generators::Base
      desc "Copies heartlike views to your application."

      argument :scope, required: false, default: nil,
               desc: "The scope to copy views to"

      invoke HeartsViewsGenerator

      hook_for :form_builder, aliases: "-b",
               desc: "Form builder to be used",
               default: "form_for"

    end
  end
end