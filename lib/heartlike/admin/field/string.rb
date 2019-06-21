require_relative "base"


module Heartlike
  module Admin
    module Field
      class String < Field::Base


        private

        def truncation_length
          options.fetch(:truncate, 50)
        end
      end
    end
  end
end