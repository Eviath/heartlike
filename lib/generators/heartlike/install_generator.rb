# frozen_string_literal: true

require 'rails/generators/base'
require 'securerandom'

module Devise
  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Heartlike initializer and copy locale files to your application."

      def copy_initializer
        template "heartlikee.rb", "config/initializers/heartlike.rb"
      end

      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/heartlike.en.yml"
      end

      def rails_4?
        Rails::VERSION::MAJOR == 4
      end
    end
  end
end