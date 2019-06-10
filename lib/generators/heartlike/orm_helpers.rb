# frozen_string_literal: true

module Heartlike
  module Generators
    module OrmHelpers
      def model_contents(parent)
        buffer = <<-CONTENT
  # If you have not specified '--parent-model=ModelName' in generator
  # change belongs_to to your model association
  # :article is default
  belongs_to :#{parent ? parent.downcase : 'article'}
  # User association, change if needed to your User model
  belongs_to :user, optional: true
        CONTENT
        buffer
      end

      private

      def model_exists?
        File.exist?(File.join(destination_root, model_path))
      end

      def migration_exists?(table_name)
        Dir.glob("#{File.join(destination_root, migration_path)}/[0-9]*_*.rb").grep(/\d+_add_heartlike_to_#{table_name}.rb$/).first
      end

      def migration_path
        if Rails.version >= '5.0.3'
          db_migrate_path
        else
          @migration_path ||= File.join("db", "migrate")
        end
      end

      def model_path
        @model_path ||= File.join("app", "models", "#{file_path}.rb")
      end
    end
  end
end