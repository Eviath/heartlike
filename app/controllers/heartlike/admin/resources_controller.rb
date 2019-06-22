require_dependency "heartlike/application_controller"

module Heartlike
  module Admin
    class ResourcesController < ApplicationController
      layout 'heartlike/layouts/dashboard'
      before_action :initialize_resource, only: %i[index show edit new destroy create]
      before_action :find_object, only: %i[show edit destroy]

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

      def destroy
        if @object.destroy
          redirect_to admin_resources_path(resource: @resource.resource)
        else
          redirect_to admin_resources_path(resource: @resource.resource)
          flash[:alert] = "error #{@object.errors.full_messages}"
        end
      end

      def create
        parent_param = params[:parent]
        parent = parent_param.split('_').last.singularize
        @object = "Heartlike::#{parent.camelize}".constantize.new(resource_pams(parent))

        if @object.save
          redirect_to admin_resource_path(@object.id, resource: parent_param)
        else
          render 'heartlike/admin/resources/new', locals: { resource: parent_param }
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

      def resource_pams(parent)
        params.require(:"#{parent}").permit(params[:"#{parent}"].keys)
      end


    end
  end
end
