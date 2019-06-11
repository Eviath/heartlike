class CreateHeartlikeArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :heartlike_articles do |t|
      # Base of article
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true

      # Hearts counter =counter_cache=
      t.integer :hearts_count, default: 0

      t.timestamps
    end
  end
end
