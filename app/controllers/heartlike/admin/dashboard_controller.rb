require_dependency "heartlike/application_controller"

module Heartlike
  module Admin
    class DashboardController < ApplicationController
      layout 'heartlike/layouts/dashboard'

      def index
        resources = []
        ActiveRecord::Base.connection.tables.each do |t|
          if t.start_with?('heartlike')
            resources <<  t.split('_').last.camelize
          end
        end

        @resources = resources
      end

    end
  end
end
