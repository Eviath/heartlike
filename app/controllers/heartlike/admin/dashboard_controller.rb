require_dependency "heartlike/application_controller"

module Heartlike
  module Admin
    class DashboardController < ApplicationController
      layout 'heartlike/layouts/dashboard'

      def index
        Rails.application.eager_load!
        @models = ApplicationRecord.descendants
      end

    end
  end
end
