require_dependency "heartlike/application_controller"

module Heartlike
  module Admin
    class ResourcesController < ApplicationController
      layout 'heartlike/layouts/dashboard'
      before_action :initialize_resource, only: %i[index show edit new]
      before_action :find_object, only: %i[show edit]

      def index
        @resources = @resource.resource_collection
      end

      def show
        @object = Resource.new(resource_params, @object)
      end

      def edit
      end

      def new
        @object = @resource.resource_class.new
      end

      def create
        if @object.save
          redirect_to admin_resource_path(@object)
        else
          render 'heartlike/admin/resources/new', locals: { resource: @object }
        end
      end

      protected

      def resource_params
        [params[:resource], params[:action]]
      end

      def initialize_resource
        @resource = Resource.new(resource_params)
      end

      def find_object
        @object = @resource.find_objects(id: params[:id])
      end

    end
  end
end
