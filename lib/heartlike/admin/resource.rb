module Heartlike
  module Admin
    class Resource
      def initialize(model)
        @resource = model
      end

      def resource
        @resource
      end

      def resource_name
        @resource.split('_').last.singularize.camelize
      end

      def resource_class
        if @resource.include?('::')
          resource.constantize
        else
          @resource.titleize.split(' ').join('::').singularize.constantize
        end
      end

      def all_objects
        resource_class.all
      end

      def find_objects(options)
        resource_class.find_by(options)
      end

    end
  end
end