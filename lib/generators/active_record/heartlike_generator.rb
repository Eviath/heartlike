# frozen_string_literal: true

require 'rails/generators/active_record'
require 'generators/heartlike/orm_helpers'

module ActiveRecord
  module Generators
    class HeartlikeGenerator < ActiveRecord::Generators::Base
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      class_option :parent_model, type: :string, desc: 'Model name of which Heartlike model will belong to'
      class_option :primary_key_type, type: :string, desc: "The type for primary key"

      include Heartlike::Generators::OrmHelpers
      source_root File.expand_path("../templates", __FILE__)

      def copy_heartlike_migration
        # if (behavior == :invoke && model_exists?) || (behavior == :revoke && migration_exists?(table_name))
        #   migration_template "migration_existing.rb", "#{migration_path}/add_heartlike_to_#{table_name}.rb", migration_version: migration_version
        # else
        #   migration_template "migration.rb", "#{migration_path}/heartlike_create_#{table_name}.rb", migration_version: migration_version
          migration_template "article_migration.rb", "#{migration_path}/heartlike_create_articles.rb", migration_version: migration_version
        # end
      end

      def generate_model
          invoke "active_record:model", [name], migration: false unless model_exists? && behavior == :invoke
      end

      def inject_heartlike_content
        content = model_contents(options[:parent_model])

        class_path = if namespaced?
                       class_name.to_s.split("::")
                     else
                       [class_name]
                     end

        indent_depth = class_path.size - 1
        content = content.split("\n").map { |line| "  " * indent_depth + line }.join("\n") << "\n"

        inject_into_class(model_path, class_path.last, content) if model_exists?
      end


      def ip_column
        # Padded with spaces so it aligns nicely with the rest of the columns.
        "%-8s" % (inet? ? "inet" : "string")
      end

      def inet?
        postgresql?
      end

      def rails5_and_up?
        Rails::VERSION::MAJOR >= 5
      end

      def postgresql?
        config = ActiveRecord::Base.configurations[Rails.env]
        config && config['adapter'] == 'postgresql'
      end

      def migration_version
        if rails5_and_up?
          "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
        end
      end

      def primary_key_type
        primary_key_string if rails5_and_up?
      end

      def primary_key_string
        key_string = options[:primary_key_type]
        ", id: :#{key_string}" if key_string
      end
    end
  end
end