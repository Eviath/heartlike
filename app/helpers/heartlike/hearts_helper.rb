module Heartlike
  module HeartsHelper
    def guest_or_user_hearted?(article)
      heart_token_cookie(article) || user_signed_in? && current_user.hearted?(article)
    end

    def heart_token_cookie(article)
      cookies.encrypted["heart_token_#{article.id}"]
    end
  end
end
