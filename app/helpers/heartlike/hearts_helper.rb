module Heartlike
  module HeartsHelper
    def guest_or_user_hearted?(article)
      heart_token_cookie(article) || user_signed_in? && article.hearted_by?(current_user)
    end

    def heart_token_cookie(article)
      cookies.encrypted["heart_token_#{article.id}"]
    end
  end
end
