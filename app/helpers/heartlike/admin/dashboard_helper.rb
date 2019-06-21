module Heartlike
  module Admin::DashboardHelper
    def heartlike_resources
      Heartlike::Admin::Dashboard.resources
    end


    # def form_resource(resource)
    #   things = {}
    #   resource.class.attribute_names.each { |k| things["#{k}"] = resource.class.type_for_attribute(k).type }
    #   things
    # end

    # def form_attributes(form, type, column)
    #   if type.to_s == 'integer' && column != 'id'
    #     attribute_class = "Heartlike::#{column.split('_').first.camelize.singularize}".constantize
    #   end
    #   label = form.label :"#{column}"
    #   field = if type.to_s == 'string'
    #             form.text_field :"#{column}", class: 'form-control'
    #           elsif type.to_s == 'integer'
    #             if column == 'id'
    #             else
    #               form.select(:"#{column}", attribute_class.all.collect {|u| [u.inspect, u.id]}, :prompt => 'Select', class:'form-control')
    #             end
    #
    #           elsif type.to_s == 'datetime'
    #             form.date_field :"#{column}", class: 'form-control'
    #           elsif type.to_s == 'text'
    #             form.text_area :"#{column}", class: 'form-control'
    #           end
    #
    #   label + field
    #
    # end
  end
end