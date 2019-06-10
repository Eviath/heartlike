module Heartlike
  class Heart < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :article, counter_cache: true
    has_secure_token :heart_token
  end
end
