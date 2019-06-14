module Heartlike
  module ArticlesHelper
    def render_hearts(article)
      render template: 'heartlike/hearts/hearts', locals: { article: article }
    end

    def get_column_size
      cookies[:column_size] || params[:column_size]
    end
  end
end
