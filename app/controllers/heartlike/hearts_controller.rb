require_dependency "heartlike/application_controller"

module Heartlike
  class HeartsController < ApplicationController
    before_action :find_article

    def heart
      if user_signed_in?
        @article.heart!(current_user.id)
      else
        heart = @article.heart!
        cookies.permanent.encrypted["heart_token_#{@article.id}"] = heart.heart_token
      end
      respond_to do |format|
        format.html do
          redirect_to @article
        end
        format.js
      end
    end

    def unheart
      if user_signed_in?
        @article.unheart!(current_user.id)
      else
        @article.unheart!(false, params[:heart_token])
        cookies.delete "heart_token_#{@article.id}"
      end
      respond_to do |format|
        format.html do
          redirect_to @article
        end
        format.js
      end
    end

    private

    # Set article
    def find_article
      @article = Article.find(params[:article_id])
    end
  end
end