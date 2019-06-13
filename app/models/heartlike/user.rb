module Heartlike
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :articles
    has_many :hearts

    # Check if user hearted article
    def hearted?(article)
      self.hearts.find_by(article_id: article.id)
    end
  end
end
