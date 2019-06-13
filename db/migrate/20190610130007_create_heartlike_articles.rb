class CreateHeartlikeArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :heartlike_articles do |t|
      # Base of article
      t.string :title
      t.text :body
      t.references :user, null: false

      # Hearts counter =counter_cache=
      t.integer :hearts_count, default: 0

      t.timestamps
    end
    add_foreign_key :heartlike_articles, :heartlike_users, column: :user_id
  end
end
