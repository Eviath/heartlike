module Heartlike
  module Admin
    module Resources

      ATTRIBUTE_TYPES = {
          id: 'integer',
          title: 'string',
          body: 'text',
          created_at: 'date',
          updated_at: 'date',
          category_id: 'select',
          user_id: 'select',
          article_id: 'select'
      }

      COLLECTION_ATTRIBUTES = %w[id name email title created_at user_id category_id].freeze

      SHOW_ATTRIBUTES = %w[id title body user_id category_id article_id].freeze

      FORM_ATTRIBUTES = %w[body name email title created_at updated_at user_id category_id article_id heart_id].freeze

      def self.attribute_types
        self::ATTRIBUTE_TYPES
      end

      %w[COLLECTION SHOW FORM].each do |f|
        define_method :"#{f}_attributes" do
          "#{self}::#{f}_ATTRIBUTES"
        end
      end

    end
  end
end