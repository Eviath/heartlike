require_dependency "heartlike/application_controller"

module Heartlike
  module Admin
    class ResourcesController < ApplicationController
      layout 'heartlike/layouts/dashboard'

      def index
        @resources = "Heartlike::#{params[:resource].singularize}".constantize.all
      end

      def show
        resource = params[:resource].classify.constantize
        object = params[:id]

        @resource = resource.find(object)

      end

      def edit
        resource = params[:resource].classify.constantize
        object = params[:id]
        @resource = resource.find(object)
      end
    end
  end
end
