module Heartlike
  class Article < ApplicationRecord
    belongs_to :user
    has_many :hearts

    # Article methods

    # Show article title in url
    def to_param
      "#{id}-#{title.parameterize}"
    end

    # creates a new heart
    def heart!(user_id = nil)
      hearts.create!(user_id: user_id)
    end

    # destroys a heart with matching token or associated with user if exists
    def unheart!(user_id, token = nil)
      heart = if user_id
                hearts.find_by(user_id: user_id)
              else
                hearts.find_by(heart_token: token)
              end
      heart.destroy
    end
  end
end
