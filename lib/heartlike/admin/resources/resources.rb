module Heartlike
  module Admin
    module Resources
      MODEL_ATTRIBUTES = {
          heartlike_articles: %w(title id user_id, created_at),
          heartlike_hearts: %w(id),
          heartlike_users: %w(id),
          heartlike_categories: %w(id)
      }

      def self.model_attributes
        self::MODEL_ATTRIBUTES
      end
    end
  end
end