module Heartlike
  module Admin
    module Field
      class Base
        def initialize(attribute, data, action)
          @attribute = attribute
          @data = data
          @action = action
        end
      end
    end
  end
end
