require_dependency "heartlike/application_controller"

module Heartlike
  module Admin
    class DashboardController < ApplicationController
      layout 'heartlike/layouts/dashboard'

      include Heartlike::Admin

      def index
        @resources = Heartlike::Admin::Dashboard.resources
      end

    end
  end
end
