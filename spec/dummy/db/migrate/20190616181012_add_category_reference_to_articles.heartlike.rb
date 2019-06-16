# This migration comes from heartlike (originally 20190616174849)
class AddCategoryReferenceToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :heartlike_articles, :category, index: true
    add_foreign_key :heartlike_articles, :heartlike_categories, column: :category_id
  end
end
