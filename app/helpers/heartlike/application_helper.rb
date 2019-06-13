module Heartlike
  module ApplicationHelper
    def include_heartlike_template
      render template: 'heartlike/layouts/heartlike'
    end
  end
end
