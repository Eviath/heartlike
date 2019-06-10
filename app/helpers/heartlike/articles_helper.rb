module Heartlike
  module ArticlesHelper
    def render_hearts(article)
      render template: 'heartlike/hearts/hearts', locals: { article: article }
    end
  end
end
