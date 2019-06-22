module Heartlike
  module Admin::ResourcesHelper

    # heartlike/admin/resources/_resource
    def render_resource_attribute(key, value)
      if key.include?('_id')
        link_to value, admin_resource_path("Heartlike::#{key.split('_').first.camelize}".constantize.find_by_id(value), resource: "heartlike_#{key.split('_').first.pluralize}")
      else
        value.to_s
      end
    end

  end
end