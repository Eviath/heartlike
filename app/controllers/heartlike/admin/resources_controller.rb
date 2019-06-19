require_dependency "heartlike/application_controller"

module Heartlike
  module Admin
    class ResourcesController < ApplicationController
      layout 'heartlike/layouts/dashboard'
      before_action :find_resource, only: [:index, :show, :edit]
      before_action :find_object, only: [:show, :edit]

      def index
        @resources = @resource.all_objects
      end

      def show
      end

      def edit
      end

      def new
        resource = params[:resource].classify.constantize
        @object = resource.new
      end

      def create
        if @object.save
          redirect_to admin_resource_path(@object)
        else
          render 'heartlike/admin/resources/new', locals: { resource: @object }
        end
      end

      protected

      def find_resource
        @resource = Heartlike::Admin::Resource.new(params[:resource])
      end

      def find_object
        @object = @resource.find_objects(id: params[:id])
      end

    end
  end
end
