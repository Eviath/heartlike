module Heartlike
  module Admin
    class Resource
      include Heartlike::Admin::Resources

      def initialize(resource, object = nil)
        @resource = resource
        @object = object
        @attributes = {}
        @options = MODEL_ATTRIBUTES[:"#{@resource}"]

        if !@options.nil? && !@object.nil?
          @options.each { |option| @object.attributes.each { |key, value| @attributes[key] = value if key.in?([option, 'id']) } } if @object.respond_to?(:attributes)
        end
      end


      def resource
        @resource
      end

      def resource_attributes
        @attributes
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