require_dependency "heartlike/application_controller"

module Heartlike
  module Admin
    class DashboardController < ApplicationController
      layout 'heartlike/layouts/dashboard'

      def index
        @resources = Dashboard.resources
      end

    end
  end
end
