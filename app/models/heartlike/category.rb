module Heartlike
  class Category < ApplicationRecord
    has_many :articles
  end
end
