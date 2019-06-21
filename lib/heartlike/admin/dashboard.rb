module Heartlike
  module Admin
    class Dashboard

      def self.resources
        resources = []
        ActiveRecord::Base.connection.tables.map do |model|
          if model.start_with?('heartlike')
            resources << Heartlike::Admin::Resource.new([model, nil])
          end
        end
        resources
      end

    end
  end
end