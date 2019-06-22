module Heartlike
  module Admin
    class Resource
      include Heartlike::Admin::Resources

      def initialize(params, object = nil)
        @resource = params.first
        @action = params.last
        @object = object
        @attribute_types = Resources::ATTRIBUTE_TYPES
        @attributes = {}

        @options = if @action == 'show'
                     SHOW_ATTRIBUTES
                   elsif @action == 'index'
                     COLLECTION_ATTRIBUTES
                   else
                     FORM_ATTRIBUTES
                   end

        if !@options.nil? && !@object.nil?
          @options.each { |option| @object.attributes.each { |key, value| @attributes[key] = value if key.in?([option, 'id']) } } if @object.respond_to?(:attributes)
        end
      end

      def attributes
        @attributes.select {|k, _| k.exclude?('_id')}
      end

      def association_attributes
        @attributes.select {|k, _| k.include?('_id')}
      end

      def resource_collection
        resources = []
        all_objects.each { |object| resources << Resource.new([@resource, @action], object) }
        resources
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

      attr_reader :resource, :options, :action, :attribute_types

    end
  end
end