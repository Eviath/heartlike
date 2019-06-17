module Heartlike
  module Admin::DashboardHelper
    def heartlike_resources
      resources = []
      ActiveRecord::Base.connection.tables.each do |t|
        if t.start_with?('heartlike')
          resources <<  t.split('_').last.camelize
        end
      end

      resources
    end
  end
end
